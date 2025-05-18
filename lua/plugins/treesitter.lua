return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "go", "gomod", "gowork", "gosum", "gotmpl", "javascript", "typescript", "html", "ruby", "python", "sql", "terraform", "hcl", "c_sharp", "cpp", "dockerfile", "json5", "markdownlint-cli2", "markdown-toc" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
