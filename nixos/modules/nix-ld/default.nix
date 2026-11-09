{ pkgs, ... }:

{
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc.lib 
      zlib 
      zstd
      openssl
      curl
      libxml2
      icu
      glib
      dbus
      systemd
      wayland
      libxkbcommon
      libxcb
      libx11
      libxcursor
      libxi
      libxrandr
      libxext
      libxrender
      libxfixes
      libxinerama
      libxtst
      libGL
      libglvnd
      vulkan-loader
      mesa
      libdrm
      fontconfig
      freetype
      gtk3
      cairo
      pango
      gdk-pixbuf
      atk
      alsa-lib
      libpulseaudio
      pipewire
      openal
      libwebp
      libopus
      libdecor
      libayatana-appindicator
      ffmpeg
    ];
  };
}
