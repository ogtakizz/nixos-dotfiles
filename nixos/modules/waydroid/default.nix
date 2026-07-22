{pkgs, ...}:

{
  virtualisation.waydroid.enable = true;
  virtualisation.waydroid.package = pkgs.waydroid-nftables;

  environment.systemPackages = with pkgs; [
    wl-clipboard
    waydroid-helper
  ];

  systemd.packages = with pkgs; [
    waydroid-helper
  ];

  systemd.services.waydroid-mount.wantedBy = [ "multi-user.target" ];

}
