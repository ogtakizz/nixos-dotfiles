{ inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  rbw
  libmtp
  mtpfs
  nautilus
  mesa
  mesa-demos
  swww
  wireguard-tools
  proton-vpn
  mpv
  kitty
  pywal
  imagemagickBig
  nwg-look
  wget
  git
  flatpak
  protontricks
  gparted
  bluez
  bluez-tools
  logmein-hamachi
  python3
  go
  pipx
  glib
  gtk3
  gobject-introspection
  rclone
  inputs.helium-browser.packages.x86_64-linux.default
  ];
}
