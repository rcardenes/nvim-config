vim.pack.add({
    { src = "https://github.com/olimorris/codecompanion.nvim",
      version = vim.version.range("^19"), },
})

require("codecompanion").setup({})
