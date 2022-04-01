#!/bin/bash

warning() {
  echo "+-----------------------------------------------------------+"
  echo "| This is highly destructive script, use at your own risks! |"
  echo "+-----------------------------------------------------------+"
  echo
}

if [[ $1 == '-h' || $# -ne 1 ]]; then
  warning; echo "Usage: $0 /dev/sdx"; exit
elif [[ $EUID -ne 0 ]]; then
  warning; echo "Error: Must be run as root."; exit
fi

DRIVE=$1
BOOT_DRIVE=${DRIVE}1
LUKS_DRIVE=${DRIVE}2

read -sp "Passphrase for ${LUKS_DRIVE}: " PASSPHRASE

echo
echo "| Wiping ${DRIVE}..."
echo 'y' | mkfs.ext4 -O "^has_journal" ${DRIVE} &>/dev/null
wipefs -a ${DRIVE} &>/dev/null

echo "| Formating ${DRIVE}..."
echo "n
p


+300M
t
ef
n




w" | fdisk ${DRIVE} &>/dev/null

echo "| Encrypting ${LUKS_DRIVE}..."
echo -n "$PASSPHRASE" | cryptsetup luksFormat ${LUKS_DRIVE} -
echo -n "$PASSPHRASE" | cryptsetup open ${LUKS_DRIVE} install

echo "| Creating logical volumes (root, home)..."
pvcreate /dev/mapper/install
vgcreate vgusb /dev/mapper/install
lvcreate -L 10G vgusb -n root
lvcreate -L 20G vgusb -n home

echo "| Creating file systemes on volumes (boot, root, home)..."
mkfs.fat -F 32 ${BOOT_DRIVE} &>/dev/null
mkfs.ext4 -O "^has_journal" /dev/vgusb/root &>/dev/null
mkfs.ext4 -O "^has_journal" /dev/vgusb/home &>/dev/null

echo "| Creating and mounting filesystem layout under /mnt..."
mount /dev/vgusb/root /mnt &>/dev/null
mkdir /mnt/home &>/dev/null
mount /dev/vgusb/home /mnt/home &>/dev/null
mkdir /mnt/boot &>/dev/null
mount ${BOOT_DRIVE} /mnt/boot &>/dev/null

echo "| Installing base system..."
pacstrap /mnt base linux linux-firmware &>/dev/null

echo "| Creating fstab..."
genfstab -U /mnt > /mnt/etc/fstab
nvim /mnt/etc/fstab

echo "| Introducing bootstraping script..."
DEVUUID=$(blkid | grep $LUKS_DRIVE | cut -d '"' -f 2)
cat > /mnt/home/bootstrap.sh <<EOF
#!/bin/bash
pacman -S --noconfirm lvm2 grub efibootmgr git sudo networkmanager
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
echo 'KEYMAP=fr-latin1' > /etc/vconsole.conf
echo 'cyberkepon' > /etc/hostname
sed -i 's/^HOOKS=.*/HOOKS=(base udev block keyboard keymap autodetect consolefont modconf encrypt lvm2 filesystems fsck)/' /etc/mkinitcpio.conf
sed -i 's!^GRUB_CMDLINE_LINUX=.*!GRUB_CMDLINE_LINUX="cryptdevice=UUID=$DEVUUID:cryptlvm root=/dev/vgusb/root"!' /etc/default/grub
mkinitcpio -P
grub-install --target=x86_64-efi --efi-directory=/boot --removable --recheck
grub-mkconfig -o /boot/grub/grub.cfg
useradd -m tristan
echo 'tristan ALL=(ALL) ALL' > /etc/sudoers.d/10-tristan
mkdir -p /home/tristan/sources/0b11stan/
git clone https://github.com/0b11stan/dotfiles.git /home/tristan/sources/0b11stan/dotfiles
chown -R tristan:tristan /home/tristan/
passwd tristan
rm -r /home/bootstrap.sh
EOF
chmod +x /mnt/home/bootstrap.sh

echo "| Chrooting..."
echo "> You should now run /home/bootstrap.sh"
arch-chroot /mnt

echo "| Umount and close everything ..."
umount -R /mnt
vgchange -a n vgusb
cryptsetup close install
