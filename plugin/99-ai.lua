-- vim.pack.add({
--     { src = "https://github.com/olimorris/codecompanion.nvim",
--       version = vim.version.range("^19"), },
-- })
--
-- require("codecompanion").setup({})

vim.pack.add({
    "https://github.com/coder/claudecode.nvim"
})

require("claudecode").setup({})

local map = vim.keymap.set

-- map("n", "<leader>a", nil, { desc = "AI/Claude Code" })
map("n", "<leader>ac", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude" })
map("n", "<leader>af", "<cmd>ClaudeCodeFocus<cr>", { desc = "Focus Claude" })
map("n", "<leader>ar", "<cmd>ClaudeCode --resume<cr>", { desc = "Resume Claude" })
map("n", "<leader>aC", "<cmd>ClaudeCode --continue<cr>", { desc = "Continue Claude" })
map("n", "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", { desc = "Select Claude model" })
map("n", "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", { desc = "Add current buffer" })
map("v", "<leader>as", "<cmd>ClaudeCodeSend<cr>", { desc = "Send to Claude" })
-- {
--     "<leader>as",
--     "<cmd>ClaudeCodeTreeAdd<cr>",
--     desc = "Add file",
--     ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
-- },
-- Diff management
map("n", "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", { desc = "Accept diff" })
map("n", "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", { desc = "Deny diff" })
