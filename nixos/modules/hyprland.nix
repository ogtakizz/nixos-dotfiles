{ pkgs, ... }:

{
  	programs.hyprland = {
    		enable = true;
		xwayland.enable = true;
	};

	services.displayManager.sessionPackages = [ pkgs.hyprland ];
  	services.displayManager.defaultSession = "hyprland";

	environment.systemPackages = with pkgs; [
		ags
		brightnessctl
		networkmanagerapplet
		playerctl
		libnotify
	];

	hardware.bluetooth.enable = true;
	services.blueman.enable = true;
}
