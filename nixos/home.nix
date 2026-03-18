{ inputs, config, pkgs, ... }:

{
  imports = [
     ./modules/zsh
    ./modules/nvchad
    inputs.spicetify-nix.homeManagerModules.default
    ./modules/spicetify
    ./modules/system/wireplumber.nix
  ];

  home.username = "garcia";
  home.homeDirectory = "/home/garcia";
  home.stateVersion = "25.05";

  home.pointerCursor = {
    gtk.enable = true;
    #x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  qt = {
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  programs.gh = {
    enable = true;
    settings = {
     git_protocol = "https";
    };
   };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "ogtakizz";
        email = "91156885+ogtakizz@users.noreply.github.com";
      };
      init.defaultBranch = "main";
      credential.helper = "${pkgs.gh}/bin/gh auth git-helper";
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };

  services.udiskie = {
    enable = true;
    settings = {
      program_options = {
        file_manager = "${pkgs.kdePackages.dolphin}/bin/dolhpin";
      };
    };
  };

  services.gpg-agent = {
    enable = true;
    pinentry = {
      package = pkgs.pinentry-tty;
    };
    extraConfig = ''
      allow-loopback-pinentry
    '';
  };

  home.packages = with pkgs; [
	inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.osu-lazer-bin
  pipes-rs
  gnupg
  pinentry-tty
  gallery-dl
  matugen
  discord
	lutris
	btop
	fastfetch
	vscodium
	ani-cli
	jetbrains.idea
	qbittorrent
  wlr-randr
  kdePackages.qtstyleplugin-kvantum
  libsForQt5.qtstyleplugins
	cava
	tty-clock
	vlc
	gedit
	hydralauncher
	gamescope
  ];

  home.file = {

  };

  home.sessionVariables = {
    EDITOR = "nvim";
    QT_QPA_PLATFORMTHEME = "gtk2";
    QT_STYLE_OVERRIDE = "kvantum-dark";
    NIXOS_OZONE_WL = "1";
    GCM_CREDENTIAL_STORE = "cache";
    GIT_ASKPASS = "";
    SSH_ASKPASS = "";
    MOZ_ENABLE_WAYLAND = "1";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
