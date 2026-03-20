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

  systemd.user.services.rclone-gdrive = {
    after = [ "network-online.target" ];
    wantedBy = [ "default.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.rclone}/bin/rclone mount gdrive: /home/garcia/nuvem/musicas \
      --vfs-cache-mode full \
      --vfs-cache-max-size 10G \
      --allow-other \
      --uid 1000 \
      --gid 100 \
      --vfs-cache-max-age 24h \
      --buffer-size 32M";
      ExecStop = "/run/current-system/sw/bin/fusermount -u /home/garcia/nuvem/musicas";
      Restart = "on-failure";
      RestartSec = "10s";
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
    "nvme_core.default_ps_max_latency_us=0"
    "split_lock_detect=off"
    "iwlwifi.power_save=0"
    "iwlmvm.power_scheme=1"
  ];
  
  boot.supportedFilesystems = ["ntfs"];
  
  boot.loader.systemd-boot.configurationLimit = 3;
  boot.loader.timeout = 3;
}
