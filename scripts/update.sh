#!/usr/bin/env bash

$DOTFILES = "/home/garcia/mysystem"

cd /home/$USER/$DOTFILES

sudo nixos flake update
sudo nixos-rebuild switch --flake .#myNixos

git add --all
git commit -m "Nixos Update ${date +%Y-%m-%d}"
git push
