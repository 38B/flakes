#!/bin/sh

# bool function to test if the user is root or not
is_user_root () { [ "${EUID:-$(id -u)}" -eq 0 ]; }
partition_vda () {}
mount_vda () {}
config_nixos () {}
install_nixos () {}

if is_user_root; then
  partition_vda
  mount_vda
  config_nixos
  install_nixos
  exit 0
else
  echo "You must be root to run this script!" >&2
  exit 1
fi
