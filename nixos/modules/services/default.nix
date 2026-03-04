{ pkgs, inputs, ... }:

{
  nixpkgs.overlays = [
    inputs.millennium.overlays.default
  ];

  programs.steam = {
    enable = true;
    package = pkgs.millennium-steam;
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

  services.gvfs.enable = true;

  services.udisks2.enable = true;

  services.logmein-hamachi.enable = true;
  
  services.joycond.enable = true;

  services.flatpak.enable = true;

  services.xserver.enable = true;
  services.libinput.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  
  services.desktopManager.plasma6.enable = false;
}
