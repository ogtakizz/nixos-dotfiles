{ inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  rbw
  libmtp
  nautilus
  mesa
  mesa-demos
  awww
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
  bottles
  glib
  gtk3
  gobject-introspection
  rclone
  ];
}
