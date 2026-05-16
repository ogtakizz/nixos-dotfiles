{ pkgsStable, ... }:

{
  environment.systemPackages = with pkgsStable; [
    opencode
    easyeffects
    kdePackages.okular
    kdePackages.kio-extras
    kdePackages.kdenlive
    gnome-software
    ntfs3g
    edk2-uefi-shell
    unrar
    unzip
    zip
    p7zip
    onlyoffice-desktopeditors
    lunar-client
    rsync
    cachix
    jq
    fzf
    yt-dlp
    ngrok
    azahar
    wine
  ];
}
