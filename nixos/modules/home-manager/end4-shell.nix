{ pkgs, quickshell, ... }:

{
  home.packages = with pkgs; [
    (import ./quickshell-wrapper.nix { inherit pkgs quickshell; })

    libcava
    lxqt.pavucontrol-qt
    wireplumber
    libdusmenu-gtk3
    playerctl

    (geoclue2.override { withDemonAgent = true; })
    brightnessctl
    ddcutil

    bc 
    uutils-coreutils-noprefix
    cliphist
    cmake
    curllFull
    wget 
    ripgrep
    jq
    xdg-user-dirs
    rsync
    yq-go

    bibata-cursors

    adw-gtk3
    kdePackages.breeze
    kdePackages.breeze-icons

    darkly
    darkly-qt5
    eza
    fontconfig
    kitty
    matugen
    starship
    nerd-fonts.jetbrains-mono
    material-symbols
    rubik
    twemoji-color-font

    hyprsunset
    wl-clipboard
    kdePackages.bluedevil
    gnome-keyring
    networkmanager
    kdePackages.plasma-nm
    kdePackages.dolphin
    kdePackages.systemsetting

    uv
    gtk4
    libadwaita
    libsoup_3
    libportal-gtk4
    gobject-introspection

    hyprshot
    slurp
    swappy
    tesseract
    wf-recorder

    upower
    wtype
    ydotool

    fuzzel
    glib
    imagemagick
    hypridle
    hyprlock
    hyprpicker
    songrec
    translate-shell
    wlogout
    libqalculate

    foot
    kdePackages.kconfig
  ];
}
