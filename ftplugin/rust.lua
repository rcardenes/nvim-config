local function virt_line_diagnostics(jumpCount)
    pcall(vim.api.nvim_del_augroup_by_name, "virt_line_Diagnostics") -- prevent autocmd repeated jumps

    vim.diagnostic.jump { count = jumpCount }

--    vim.cmd.RustLsp('explainError')

    vim.diagnostic.config {
        -- virtual_text = false,
        virtual_lines = { current_line = true, current_line_only = true },
    }
end

local bufnr = vim.api.nvim_get_current_buf()
local opts = { silent = true, buffer = bufnr }
vim.keymap.set(
  "n",
  "<leader>a",
  function()
    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  end,
  opts
)

vim.keymap.set(
  "n",
  "K",  -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.cmd.RustLsp({'hover', 'actions'})
  end,
  opts
)

vim.keymap.set(
    'n',
    ']d',
    function() virt_line_diagnostics(1) end,
    opts
)

vim.keymap.set(
    'n',
    '[d',
    function() virt_line_diagnostics(-1) end,
    opts
)
