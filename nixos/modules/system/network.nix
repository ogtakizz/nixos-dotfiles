{ pkgs, ... }:

{
  networking = {
    hostName = "NixBTW";
    firewall.checkReversePath = false;
    
    networkmanager.enable = true;
    networkmanager.dns = "systemd-resolved";

    firewall = {
      enable = true;
      trustedInterfaces = [ "virbr0" ];
      # allowedTCPPorts = [ 80 443 ];
      # allowedUDPPorts = [ 4000 5000 ];
    };
  };

  nix.settings = {
    substituters = [
      "https://cache.nixos.org/"
      "https://nix-gaming.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-gaming.cachix.org-1:nbnuYDEmS6SC9397G7KNoq9K9S4M8L857SThoXv2v/E="
    ];
  };

  services.openssh.enable = true;

  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  # enable = true;
  # enableSSHSupport = true;
  # }
  
  environment.systemPackages = with pkgs; [ 
     dnsmasq
     bridge-utils
  ];

  networking.resolvconf.enable = false;

  services.resolved = {
    enable = true;
    settings = {
      Resolve = {
        DNS = "1.1.1.1#cloudflare-dns.com 1.0.0.1#cloudflare-dns.com";
        DNSOverTLS = "yes";
        DNSSEC = "allow-downgrade";
      };
    };
  };

  time.timeZone = "America/Sao_Paulo";
  
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };
}
