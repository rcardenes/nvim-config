vim.pack.add({
    "https://github.com/goolord/alpha-nvim",
})

local config = require("alpha.themes.startify").config
config.file_icons_provider = "devicons"

require("alpha").setup(config)
