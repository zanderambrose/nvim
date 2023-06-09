vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- split screen and navigation
vim.keymap.set("n", "<leader>v", ":vsplit<CR><C-w>l", { noremap = true })
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>", { noremap = true })
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>", { noremap = true })

-- Tabs
vim.keymap.set("n", "<leader>]", ":tabnext<CR>", { noremap = true })
vim.keymap.set("n", "<leader>[", ":tabprevious<CR>", { noremap = true })

-- TERMINAL SETUP
require("toggleterm").setup({
    direction = "float",
    size = 40,
    open_mapping = "<leader>pt",
    autochdir = true,
    shade_terminals = true,
    highlights = {
        Normal = {
            guibg = 'black'
        }
    }
})

vim.keymap.set("n", "<leader>e", ":lua vim.diagnostic.open_float(0, {scope='line'})<CR>", { noremap = true })

-- Prettier format
vim.keymap.set("n", "<leader>pw", ":w | !npx prettier --write '%'<CR><CR>", { noremap = true })
