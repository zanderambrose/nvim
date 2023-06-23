require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ["<CR>"] = require('telescope.actions').select_tab,
            },
        },
        layout_config = {
            horizontal = {
                preview_cutoff = 0,
                width = 0.99,
                height = 0.99,
            },
        },
    },
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>?', builtin.oldfiles, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<leader>f', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>pa', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
