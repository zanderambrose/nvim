require("zander")
vim.cmd([[
  augroup SetTabLineColors
    autocmd!
    autocmd VimEnter * highlight TabLine guifg=DarkGray guibg=Black
    autocmd VimEnter * highlight TabLineSel guifg=DarkGray guibg=DarkBlue
  augroup END
]])
