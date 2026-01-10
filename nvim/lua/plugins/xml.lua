return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lemminx = {
          settings = {
            xml = {
              validation = {
                noGrammar = "ignore",
              },
            },
          },
        },
      },
    },
    init = function()
      vim.filetype.add({
        extension = {
          xacro = "xml",
          urdf = "xml",
          sdf = "xml",
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "xml" })
    end,
  },
}
