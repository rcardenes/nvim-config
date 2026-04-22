vim.pack.add {
    'https://github.com/neovim/nvim-lspconfig',
}

vim.lsp.config.lua_ls = {
    settings = {
        diagnostics = {
            globals = {
                'vim',
                'require',
            },
        },
    }
}

vim.lsp.enable({
    "lua_ls",
    "clang",
    "rust_analyzer",
    "basedpyright",
})
