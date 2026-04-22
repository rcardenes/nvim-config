vim.pack.add({
    "https://github.com/saecki/crates.nvim",
    "https://github.com/mrcjkb/rustaceanvim",
})

require("crates").setup({})
-- Note: there's no need to call rutaceanvim. If any setup is required,
--       refer to the plugin documentation.
