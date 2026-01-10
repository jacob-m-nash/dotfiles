return {
  {
    "neovim/nvim-lspconfig",
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
}
