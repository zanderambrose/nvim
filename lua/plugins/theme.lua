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
        })

        vim.cmd("colorscheme carbonfox")

        -- Custom highlights
        vim.api.nvim_set_hl(0, "Normal", { bg = "#0a0a0a" })
        vim.api.nvim_set_hl(0, "Visual", { bg = "#444444" })
    end,
}
