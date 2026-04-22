vim.pack.add({
    "https://github.com/folke/which-key.nvim"
})

local wk = require("which-key")
wk.setup({
    preset = "helix"
})

wk.add({
    { "<leader><tab>", group = "tabs" },
    { "<leader>c", group = "code" },
    { "<leader>d", group = "debug" },
    { "<leader>g", group = "git" },
    { "<leader>x", group = "diagnostics/quickfix" },
    { "[", group = "prev" },
    { "]", group = "next" },
})
