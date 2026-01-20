{ config, pkgs, ... }:

{
  programs.dconf.enable = true;
  
  users.users.garcia.extraGroups = [ "libvirtd" ];
  virtualisation.libvirtd.qemu.runAsRoot = true;
  
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice 
    spice-gtk
    spice-protocol
  ];
  
  virtualisation = {
    libvirtd = {
      enable = true;
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;
}
