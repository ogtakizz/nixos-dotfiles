{ inputs, pkgs, ...}:

{
  home.packages = with pkgs; [
# --- Games ---
    inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.osu-lazer-bin
    inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.osu-stable
    hydralauncher
    pcsx2
    ryubing
    wl-clicker
    gamescope
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
    #brave
    (inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
      nativeMessagingHosts = [ pkgs.pywalfox-native ];
    })
# --- Code ---
    vscodium
    jetbrains.idea
  ];
}
