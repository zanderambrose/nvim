-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Tabs
vim.keymap.set("n", "<leader>]", ":tabnext<CR>", { noremap = true })
vim.keymap.set("n", "<leader>[", ":tabprevious<CR>", { noremap = true })

-- split screen and navigation
vim.keymap.set("n", "<leader>v", ":vsplit<CR><C-w>l", { noremap = true })
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>", { noremap = true })
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>", { noremap = true })

-- Diagnostics
vim.keymap.set("n", "<leader>e", ":lua vim.diagnostic.open_float(0, {scope='line'})<CR>", { noremap = true })

-- Prettier format
vim.keymap.set("n", "<leader>pw", ":w | !npx prettier --write '%'<CR><CR>", { noremap = true })

-- Copy to clipboard
vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, desc = 'Copy to system clipboard' })

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
	    { "EdenEast/nightfox.nvim", config = function() vim.cmd.colorscheme "Carbonfox" end },
        { import = "plugins" },
    },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
