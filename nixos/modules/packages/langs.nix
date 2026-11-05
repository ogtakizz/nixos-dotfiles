{ config, pkgs, ... }:

let
  dotnet = with pkgs.dotnetCorePackages; combinePackages [ sdk_9_0 sdk_10_0 ];
in 
{
  programs.java = {
    enable = true;
    package = pkgs.openjdk25;
  };

  environment.systemPackages = with pkgs; [
# --- Python ---
    (python314.withPackages(ps: with ps; [ pip requests numpy ]))
# --- .NET ---
    dotnet
    omnisharp-roslyn
# --- Node ---
    nodejs_26
    yarn
# --- Rust --- 
    cargo
    rustc
    rustfmt
    rust-analyzer
    clippy
# --- Go ---
    go
    gopls
# --- PHP ---
    php85
    php85Packages.composer
# --- Ruby ---
    ruby
# --- C/C++ ---
    gcc
    clang-tools
    gnumake
    ninja
    gdb
  ];

  environment.variables = {
    GOPATH = "$HOME/.go";
    DOTNET_ROOT = "${dotnet}/share/dotnet";
    DOTNET_CLI_TELEMETRY_OPTOUT = "1";
  };
}
