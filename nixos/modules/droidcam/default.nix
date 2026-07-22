{ pkgs, config, ... }:

{
  boot.extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=10 card_label="DroidCam" exclusive_caps=1
  '';
  boot.kernelModules = [ "v4l2loopback" ];

  environment.systemPackages = with pkgs; [
    droidcam
  ];
}
