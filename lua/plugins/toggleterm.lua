return {
  "akinsho/toggleterm.nvim",
  version = "*",
  lazy = false,
  opts = {
	open_mapping = "<leader>pt",
	direction = "float",
	autochdir = true,
    shade_terminals = true,
    highlights = {
        Normal = {
            guibg = 'black'
        }
    },
	float_opts = {
        border = "single",
    	width = function()
      		return math.floor(vim.o.columns * 0.99)
    	end,
    	height = function()
      		return math.floor(vim.o.lines * 0.85)
    	end,
  	},
  }
}

