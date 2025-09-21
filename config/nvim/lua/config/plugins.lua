function set_normal_keymap(sequence, operation, _desc)
    vim.keymap.set('n', '<leader>'..sequence, function()
        operation()
    end, { desc = _desc })
end

-- Telescope config
local builtin = require('telescope.builtin')

set_normal_keymap('ff', builtin.find_files, 'Telescope find files')
set_normal_keymap('fg', builtin.live_grep, 'Telescope live grep')
set_normal_keymap('fb', builtin.buffers, 'Telescope buffers')
set_normal_keymap('fh', builtin.help_tags, 'Telescope help tags')

-- Nvim Tree config
local tree_api = require('nvim-tree.api')

set_normal_keymap('to', tree_api.tree.open, 'NvimTreeOpen')
set_normal_keymap('tc', tree_api.tree.close, 'NvimTreeClose')

-- cmp config

-- LSP configs
vim.lsp.config('luals', {
    cmd = { '/home/njrogie/Code/lsp/lua-language-server/bin/lua-language-server' },
    filetypes = { 'lua' },
    capabilities = require('blink.cmp').get_lsp_capabilities()
})


vim.lsp.enable('luals')
