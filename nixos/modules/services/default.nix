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
  services.libinput.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.desktopManager.plasma6.enable = true;
}
