#!/bin/sh

# bool function to test if the user is root or not
is_user_root () { [ "${EUID:-$(id -u)}" -eq 0 ]; }

if is_user_root; then
  parted --script /dev/vda mklabel msdos
  parted --script /dev/vda -- mkpart primary 1MiB -1GiB
  parted --script /dev/vda -- mkpart primary linux-swap -1GiB 100%
  mkswap -L swap /dev/vda2
  swapon /dev/vda2
  mkfs.ext4 -L slash /dev/vda1
  mount /dev/disk/by-label/slash /mnt
  exit 0
else
  echo "You must be root to run this script!" >&2
  exit 1
fi
