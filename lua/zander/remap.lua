vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- split screen and navigation
vim.keymap.set("n", "<leader>v", ":vsplit<CR><C-w>l", { noremap = true })
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>", { noremap = true })
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>", { noremap = true })

-- TERMINAL SETUP
require("toggleterm").setup({
	direction = "horizontal",
	size = 40,
	open_mapping = "<leader>pt", 
    autochdir = true,
    shade_terminals = false,
    highlights = {
    Normal = {
      guibg = 'black' 
    }
  }
})
