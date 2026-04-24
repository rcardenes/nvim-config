vim.pack.add({
    { src = 'https://github.com/rose-pine/neovim', name = 'rose-pine' },
    { src = 'https://github.com/ful1e5/onedark.nvim', name = 'onedark' },
    { src = 'https://github.com/EdenEast/nightfox.nvim', name = 'nightfox' },
    { src = 'https://github.com/rebelot/kanagawa.nvim', name = 'kanagawa' },

    'https://github.com/zaldih/themery.nvim',
})

local available_themes = {
    "rose-pine",
    "onedark",
    "nightfox",
    { name = "Kanagawa (Wave)", colorscheme = "kanagawa-wave"},
    { name = "Kanagawa (Lotus)", colorscheme = "kanagawa-lotus" },
    { name = "Kanagawa (Dragon)", colorscheme = "kanagawa-dragon" },
}

require("themery").setup({
    themes = available_themes,
    livePreview = true,
})
