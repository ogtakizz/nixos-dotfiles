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

  home.packages = with pkgs; [
	inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.osu-lazer-bin
  pipes-rs
  gallery-dl
  matugen
  discord
	heroic
	lutris
	btop
	fastfetch
	vscodium
	ani-cli
	jetbrains.idea
	qbittorrent
  kdePackages.qtstyleplugin-kvantum
  libsForQt5.qtstyleplugins
	cava
	tty-clock
	vlc
	gedit
	hydralauncher
	gamescope
	haguichi
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
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
