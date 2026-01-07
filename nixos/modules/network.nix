{ pkgs, ... }

{
  networking = {
    hostName = "nixos";

    networkManager.enable = true;

    firewall = {
 	Enable = true;
	#allowedTCPPorts = [ 80 443 ];
	#allowedUDPPorts = [ 4000 5000 ];
    };
  };
  
  time.timezone = "America/Sao_Paulo";
  i18n.defaultLocale = "pt_BR.UTF-8";
}
