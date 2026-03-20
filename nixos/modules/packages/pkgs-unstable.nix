{ inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  zed-editor
  rbw
  libmtp
  mtpfs
  nautilus
  mesa
  mesa-demos
  swww
  wireguard-tools
  protonvpn-gui
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
  inputs.rusic.packages.${system}.default
  rclone
  ];
}
