vim.pack.add {
    'https://github.com/neovim/nvim-lspconfig',
}

local enabled_servers = {
    "lua_ls",
    "clang",
--    "rust_analyzer",
    "basedpyright",
}

vim.lsp.enable(enabled_servers)

-- vim.lsp.config.lua_ls = {
--     settings = {
--         diagnostics = {
--             globals = {
--                 'vim',
--                 'require',
--             },
--         },
--     }
-- }

-- vim.lsp.config.rust_analyzer = {
--     settings = {
--         ["rust_analyzer"] = {
--             typeHints = { enable = true },                          -- Variable type hints
--             chainingHints = { enable = true },                      -- Method chain type hints
--             closureReturnTypeHints = { enable = "never" },          -- "never" | "always"
--             closureCaptureHints = { enable = false },               -- Closure capture hints
--             -- Parameter related
--             parameterHints = { enable = true },                     -- Function parameter hints
--             -- Brace related
--             closingBraceHints = { enable = true, minLines = 25 },   -- Closing brace hints
--             -- Other
--             bindingModeHints = { enable = false },                  -- Binding mode hints
--             discriminantHints = { enable = "never" },               -- Enum discriminant hints
--             expressionAdjustmentHints = { enable = "never" },       -- Type adjustment hints
--             implicitDrops = { enable = false },                     -- Implicit drop hints
--             lifetimeElisionHints = { enable = "never" },            -- Lifetime elision hints
--             genericParameterHints = {
--                 type = { enable = false },
--                 lifetime = { enable = false },
--                 const = { enable = false },
--             },
--         },
--     },
-- }

local on_attach = function(client, bufnr)
--    require("inlay-hints").on_attach(client, bufnr)

    local sev = vim.diagnostic.severity

    vim.diagnostic.config({
        underline = false,
        severity_sourt = true,
        update_in_insert = false, -- less flicker
        float = {
            border = "rounded",
            source=true,
        },
        -- keep signs & virtual text, but tune them as you like
        signs = {
            text = {
                [sev.ERROR] = " ",
                [sev.WARN] = " ",
                [sev.INFO] = " ",
                [sev.HINT] = "󰌵 ",
            },
        },
        virtual_text = {
            spacing = 4,
            source = "if_many",
            prefix = "●",
        },
        -- NEW in 0.11 — dim whole line
        linehl = {
            [sev.ERROR] = "DiagnosticErrorLine",
            [sev.WARN] = "DiagnosticWarnLine",
            [sev.INFO] = "DiagnosticInfoLine",
            [sev.HINT] = "DiagnosticHintLine",
        },
    }, bufnr)

    local function virt_line_diagnostics(jumpCount)
        pcall(vim.api.nvim_del_augroup_by_name, "virt_line_Diagnostics") -- prevent autocmd repeated jumps

        vim.diagnostic.jump { count = jumpCount }

        vim.diagnostic.config {
            -- virtual_text = false,
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
