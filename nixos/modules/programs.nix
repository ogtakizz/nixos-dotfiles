{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
  remotePlay.openFirewall = true;
  dedicatedServer.openFirewall = true;
  };

  programs.java = {
    enable = true;
    package = pkgs.openjdk25;
    };

  services.logmein-hamachi.enable = true;
  
  services.flatpak.enable = true;

  services.xserver.enable = true;

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

