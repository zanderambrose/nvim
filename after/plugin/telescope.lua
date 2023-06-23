require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ["<CR>"] = require('telescope.actions').select_tab,
            },
        },
    },
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>?', builtin.search_history, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<leader>f', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>pa', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
-- Testing themes
vim.keymap.set('n', '<leader>w', function()
    builtin.live_grep(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })
