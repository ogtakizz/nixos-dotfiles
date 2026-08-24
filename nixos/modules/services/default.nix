{ pkgs, inputs, ... }:

{
  imports = [
    ./audio.nix
  ];
  services.ollama = {
    enable = true;
    host = "0.0.0.0";
  };

  services.clamav = {
    daemon.enable = true;
    updater.enable = true;
  };

  programs.gpu-screen-recorder = {
    enable = true;
  };

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
      enable = false;
      restartIfChanged = true;
    };
    enableSystemMonitoring = true;
    enableVPN = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
  };

  services.gvfs.enable = true;

  services.udisks2.enable = true;

  services.logmein-hamachi.enable = true;
  
  services.joycond.enable = true;

  services.flatpak.enable = true;

  services.libinput.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  
  services.desktopManager = {
    plasma6 = {
      enable = true;
    };
  };

  services.xserver = {
    enable = true;
    desktopManager = {
      xfce = {
        enable = false;
      };
    };
  };
}
