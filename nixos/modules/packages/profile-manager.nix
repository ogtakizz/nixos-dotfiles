{ pkgs, ... }:

{
  environment.systemPackages = [
  (pkgs.makeDesktopItem {
    name = "librewolf-profiles";
    desktopName = "LibreWolf Profiles";
    exec = "librewolf -P";
    icon = "librewolf";
    categories = [ "Network" ];
   })
  ];
}
