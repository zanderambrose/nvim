return {
    "EdenEast/nightfox.nvim",
    priority = 1000,
    config = function()
        require("nightfox").setup({
            options = {
                transparent = false,
                dim_inactive = true,
            },
            palettes = {
                carbonfox = {
                    bg0 = "#0a0a0a",
                    bg1 = "#0e0e0e",
                    bg2 = "#1a1a1a",
                },
            },
            groups = {
                carbonfox = {
                    ["@variable"] = { fg = "#e0af68" },
                    Visual = { bg = "#444444" },
                    Normal = { bg = "#0a0a0a" },
                },
            },
        })

        vim.cmd("colorscheme carbonfox")
    end,
}
