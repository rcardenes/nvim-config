-- Plenary is deprecate (will be archived soon), and
-- plugins depending on it will have to adapt. Many of
-- its features have been absorbed by nvim itself though.

vim.notify("Plenary is DEPRECATED, check for dependents to see if we can get rid of it", vim.log.levels.WARN)

vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
})
