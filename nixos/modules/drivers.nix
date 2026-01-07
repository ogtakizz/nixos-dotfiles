{ pkgs, ... }:

{
   services.thermald.enable = true;

   hardware.graphics = {
     enable = true;
     extraPackages = with pkgs; [
       intel-media-driver
       libvdpau-va-gl
     ];
   };

   hardware.bluetooth.enable = true;
   hardware.bluetooth.settings = {
     General = {
       Enable = "Source,Sink,Media,Socket";
     };
   };
   services.blueman.enable = true;

   boot.kernelModules = [ "uinput" ];

   services.udev.extraRules = ''
     KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
   '';
  
   users.groups.uinput = {};

   services.printing.enable = true;
}
