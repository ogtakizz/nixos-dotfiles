{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      nvim-tree-lua
      nvim-web-devicons
      nvim-lspconfig
      telescope-nvim
      nvim-treesitter.withAllGrammars
      gruvbox-material
    ];

    extraLuaConfig = ''
      vim.g.gruvbox_material_background = 'soft'
      vim.g.gruvbox_material_better_performance = 1
      vim.cmd.colorscheme "gruvbox-material"

      require("nvim-tree").setup({
        view = {
          width = 30,
        },
      })

      vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true })

      vim.api.nvim_create_autocmd({ "VimEnter" }, {
        callback = function()
          require("nvim-tree.api").tree.open()
          vim.cmd("wincmd p") -- Volta o foco para o arquivo
        end
      })
    ''; 
  };
}
