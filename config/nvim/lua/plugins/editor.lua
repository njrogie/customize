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
        config = function()

        end
    },
}
