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
     gruvbox-material-nvim
     ];
  extraLuaConfig = ''
     vim.g.gruvbox_material_background = 'soft'
     vim.g.gruvbox_material_better_performance = 1
     vim.cmd.colorscheme "gruvbox-material"
   ''
 };
  #  extraLuaConfig = builtins.readFile ./nvim-config.lua;
}
