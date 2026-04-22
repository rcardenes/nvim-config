vim.pack.add {
    "https://github.com/mason-org/mason.nvim",
}

require("mason").setup({
    ui = {
        icons = {
            package_installed = "\u{2713}",  -- Check mark
            package_pending = "\u{279C}",    -- Rightwards arrow
            package_uninstalled = "\u{2717}" -- Ballot X
        }
    }
})
