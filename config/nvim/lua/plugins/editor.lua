return {
    {
        "nvim-tree/nvim-tree.lua",
        opts = {}
    },
    {
        "nvim-telescope/telescope.nvim",
        opts = {
            tag = '0.1.x',
            dependencies = {'nvim-lua/plenary.nvim'},
        }
    },
    {
        "vim-airline/vim-airline",
        config = function() 
            vim.g.airline_powerline_fonts = true
            vim.g.airline_theme = 'badwolf'
        end,
        dependencies = {
            "vim-airline/vim-airline-themes",
        }
    },
    {
        "bling/vim-bufferline",
    },
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '1.*',
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = { preset = 'default' },
            appearance = { nerd_font_variant = 'mono' },
            completion = { documentation = { auto_show = false } },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
            fuzzy = { implementation = "lua" }
        },
        opts_extend = {
            'sources.default'
        }
    }
}
