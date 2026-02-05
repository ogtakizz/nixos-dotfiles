{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      fira-code
      fira-code-symbols
      material-symbols
      nerd-fonts.jetbrains-mono
      liberation_ttf
      papirus-icon-theme
      adwaita-icon-theme
    ];

    fontconfig = {
      defaultFonts = {
        monospace = ["JetBrainsMono Nerd Font"];
        sansSerif = ["JetBrainsMono Nerd Font"];
        serif = ["JetBrainsMono Nerd Font"];
      };
    };
  };
}
