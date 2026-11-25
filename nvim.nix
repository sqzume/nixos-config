{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      nixd
      nixfmt
      wl-clipboard
    ];

    plugins = with pkgs.vimPlugins; [
      (nvim-treesitter.withPlugins (p: [
        p.nix
        p.lua
        p.bash
        p.hyprlang
        p.markdown
      ]))
      nvim-lspconfig
      conform-nvim
      which-key-nvim
      tokyonight-nvim
    ];

    initLua = ''
      vim.g.mapleader = " "
      local o = vim.opt
      o.number = true
      o.relativenumber = true
      o.signcolumn = "yes"
      o.termguicolors = true
      o.clipboard = "unnamedplus"
      o.undofile = true
      o.ignorecase = true
      o.smartcase = true
      o.scrolloff = 8

      o.expandtab = true
      o.tabstop = 2
      o.shiftwidth = 2
      o.softtabstop = 2
      o.smartindent = true

      vim.cmd.colorscheme("tokyonight")

      vim.api.nvim_create_autocmd("FileType", {
        callback = function() pcall(vim.treesitter.start) end,
      })
      vim.lsp.enable("nixd")
      vim.diagnostic.config({ virtual_text = true })

      require("conform").setup({
        formatters_by_ft = { nix = { "nixfmt" } },
        format_on_save = { timeout_ms = 1000, lsp_format = "fallback" },
      })

      require("which-key").setup()
    '';
  };
}
