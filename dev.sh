podman build -t dotfiles .
podman run -it --rm --userns=keep-id \
  --volume $(pwd):/home/tristan/sources/public/dotfiles/ \
  dotfiles
