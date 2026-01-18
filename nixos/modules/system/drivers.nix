{ pkgs, ... }:

{
   hardware.enableRedistributableFirmware = true;
   hardware.cpu.intel.updateMicrocode = true;

   services.thermald.enable = true;
   services.auto-cpufreq.enable = false;
   services.auto-cpufreq.settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "always";
      };
   };

   hardware.graphics = {
     enable = true;
     extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      libvdpau-va-gl
      vpl-gpu-rt
     ];
   };

   environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; };

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
