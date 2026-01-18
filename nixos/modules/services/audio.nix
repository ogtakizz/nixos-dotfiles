{ pkgs, ... }:

{
  services.pulseaudio.enable = false;
  security.rtkit.enable = truel
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
  };
}
