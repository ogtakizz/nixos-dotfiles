{ pkgs, ... }:

{
  	programs.hyprland = {
    		enable = true;
		xwayland.enable = true;
	};

	environment.systemPackages = with pkgs; [
		aylur-ags
		brightnessctl
		networkmanagerapplet
		playerctl
		libnotify
	];

	hardware.bluetooth.enable = true;
	services.blueman.enable = true;
}
