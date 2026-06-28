return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { "typos-lsp" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        typos_lsp = {
          init_options = {
            diagnosticSeverity = "Hint",
          },
        },
      },
    },
  },
}
