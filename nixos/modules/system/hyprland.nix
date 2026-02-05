{ pkgs, ... }:

{
  	programs.hyprland = {
    		enable = true;
		xwayland.enable = true;
	};

	services.displayManager.sessionPackages = [ pkgs.hyprland ];

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

	environment.systemPackages = with pkgs; [
		quickshell
		zenity
		brightnessctl
		networkmanagerapplet
		playerctl
		libnotify
    waybar
    wofi
    grim
    slurp
    wl-clipboard
    hypridle
    hyprlock
	];

	hardware.bluetooth.enable = true;
	services.blueman.enable = true;
}
