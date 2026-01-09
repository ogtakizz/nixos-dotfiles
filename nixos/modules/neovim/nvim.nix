{ config, pkgs, ... }:

{
  programs.neovim = {
     enable = true;
     defaultEditor = true;
     viAlias = true;
     vimAlias = true;

  plugins = with pkgs.vimPlugins; [
     nvim-lspconfig
     telescope-nvim
     nvim-treesitter.withAllGrammars
     gruvbox-nvim
     ];

#  extraLuaConfig = builtins.readFile ./nvim-config.lua;
  };
}
