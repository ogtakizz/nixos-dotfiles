{ pkgs, ... }:

{
  services.printing = {
    enable = true;
    drivers = [ pkgs.epson-escpr ];
  };

  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.epsonscan2 ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
