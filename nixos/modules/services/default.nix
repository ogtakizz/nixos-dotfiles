{ pkgs, inputs, ... }:

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
  
  programs.dank-material-shell.enable = true;
  programs.dms-shell = {
    enable = true;
    package = inputs.dms.packages.${pkgs.stdenv.hostPlatform.system}.default;
    systemd = {
      enable = true;
      restartIfChanged = true;
    };
    enableSystemMonitoring = true;
    enableVPN = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
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
