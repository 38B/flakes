#!/bin/sh

# TODO: add target argument 

# bool function to test if the user is root or not
is_user_root () { [ "${EUID:-$(id -u)}" -eq 0 ]; }

if is_user_root; then
  nix-shell -p git nixFlakes
  git clone https://github.com/38b/flakes.git /mnt/etc/nixos
  nixos-install --root /mnt --flake /mnt/etc/nixos#proto
  exit 0
else
  echo "You must be root to run this script!" >&2
  exit 1
fi
