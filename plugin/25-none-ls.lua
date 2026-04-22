-- Replacement for null-ls
-- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua

-- Included as a dependency

vim.pack.add({
    "https://github.com/nvimtools/none-ls.nvim",
    "https://github.com/nvimtools/none-ls-extras.nvim",
})

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.spell,
        require("none-ls.diagnostics.eslint"),  -- requires none-ls-extras.nvim
    }
})
