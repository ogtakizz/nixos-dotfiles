{ pkgs, lib, ...}:

{
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];

    config = {
      common.default = lib.mkForce [ "gtk" ];
      hyprland.default = [ "hyprland" "gtk" ];
    };
  };

  services.dbus.enable = true;
}
