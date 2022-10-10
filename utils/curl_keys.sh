#!/bin/sh

mkdir /home/nixos/.ssh
curl -L https://github.com/38b.keys > /home/nixos/.ssh/authorized_keys
