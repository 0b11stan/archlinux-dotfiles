podman build -t dotfiles .
podman run -it --rm --userns=keep-id \
  --volume $(pwd):/home/tristan/sources/0b11stan/dotfiles/ \
  dotfiles
