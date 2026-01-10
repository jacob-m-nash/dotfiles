return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lemminx = {},
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "xml" })
    end,
  },
}
