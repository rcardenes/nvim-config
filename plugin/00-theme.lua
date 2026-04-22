vim.pack.add({
    { src = 'https://github.com/rose-pine/neovim', name = 'rose-pine' },
    { src = 'https://github.com/ful1e5/onedark.nvim', name = 'onedark' },
    { src = 'https://github.com/EdenEast/nightfox.nvim', name = 'nightfox' },
})

require("rose-pine").setup()
vim.cmd.colorscheme("rose-pine")
