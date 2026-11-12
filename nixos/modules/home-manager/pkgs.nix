{ inputs, pkgs, ...}:

{
  imports = [
    inputs.zapfast.homeManagerModules.default
    inputs.zen-browser.homeModules.default
  ];

  programs.zapfast = {
    enable = true;
    settings = {
      check_for_updates = false;
    };
  };

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
    nativeMessagingHosts = [ pkgs.pywalfox-native ];
  };

  home.packages = with pkgs; [
# --- Games ---
    inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.osu-lazer-bin
    inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.osu-stable
    hydralauncher
    pcsx2
    ryubing
    wl-clicker
    gamescope
    lsfg-vk
    lsfg-vk-ui
    vulkan-tools
    mangohud
# --- Cli ---
    tree
    pipes-rs
    gallery-dl
    pinentry-tty
    fastfetch
    cava
    tty-clock
    btop
    github-copilot-cli
# --- Media ---
    ani-cli
    vlc
    mpv
# --- Other ---
    appimage-run
    thunar
    gnupg
    matugen
    wlr-randr
    ncdu
# --- Internet ---
    discord
    qbittorrent
# --- Code ---
    vscodium
    jetbrains.idea
  ];
}
