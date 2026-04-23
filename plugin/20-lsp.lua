vim.pack.add {
    'https://github.com/neovim/nvim-lspconfig',
}

local enabled_servers = {
    "lua_ls",
    "clang",
    "rust_analyzer",
    "basedpyright",
}

vim.lsp.enable(enabled_servers)

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

local on_attach = function(client, bufnr)
    vim.diagnostic.config({
        virtual_text = true,
        underline = false,
        float = true,
    }, bufnr)

    local function virt_line_diagnostics(jumpCount)
        pcall(vim.api.nvim_del_augroup_by_name, "virt_line_Diagnostics") -- prevent autocmd repeated jumps

        vim.diagnostic.jump { count = jumpCount }

        local text_cond = vim.diagnostic.config().virtual_text
        vim.diagnostic.config {
            virtual_text = false,
            virtual_lines = { current_line = true, current_line_only = true },
        }
    end

    local opts = { buffer = bufnr }
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'gl', '<cmd>lua vim.lsp.open_float()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', ']d', function() virt_line_diagnostics(1) end, opts)
    vim.keymap.set('n', '[d', function() virt_line_diagnostics(-1) end, opts)
    vim.keymap.set('n', '<leader>vrn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<leader>vca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end

-- vim.lsp.config('*', { on_attach = on_attach })
for _, cfg in pairs(enabled_servers) do
    vim.lsp.config(cfg, { on_attach = on_attach })
end
