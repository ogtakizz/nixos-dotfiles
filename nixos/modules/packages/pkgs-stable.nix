{ pkgsStable, ... }:

{
  environment.systemPackages = with pkgsStable; [
    opencode
    easyeffects
    kdePackages.dolphin
    kdePackages.okular
    kdePackages.kio-extras
    kdePackages.kdenlive
    kdePackages.syntax-highlighting
    kdePackages.ffmpegthumbs
    kdePackages.filelight
    gnome-software
    ntfs3g
    edk2-uefi-shell
    unrar
    unzip
    zip
    p7zip
    onlyoffice-desktopeditors
    lunar-client
  ];
}
