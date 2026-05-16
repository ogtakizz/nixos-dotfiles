{config, pkgs, ...}:

{
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

  services.gpg-agent = {
    enable = true;
    pinentry = {
      package = pkgs.pinentry-tty;
    };
    extraConfig = ''
      allow-loopback-pinentry
    '';
  };
}
