{ config, pkgs, ... }:

{
  boot.loader = {
    efi.canTouchEfiVariables = true;
   
    systemd-boot = {
      enable = true;
    
    windows = {
     "windows" = 
         let
           boot-drive = "HD0a0a1";
         in
         {
           title = "Windows";
           efiDeviceHandle = boot-drive;
           sortKey = "y_windows";
         };
      };
      
      edk2-uefi-shell.enable = true;
      edk2-uefi-shell.sortKey = "z_edk2";
    };
  };
  
  boot.kernelPackages = pkgs.linuxPackages_latest;
  
  boot.extraModprobeConfig = ''
    options snd_hda_intel power_save=0
    options snd_hda_intel power_save_controller=N
    options snd_sof_intel_hda_common hda_model=alc255-laptop
  '';

  boot.kernelParams = [ 
    "pcie_aspm=off"
    "snd_intel_dspcfg.dsp_driver=3"
  ];
  
  boot.supportedFilesystems = ["ntfs"];
  
  boot.loader.systemd-boot.configurationLimit = 3;
  boot.loader.timeout = 3;
}
