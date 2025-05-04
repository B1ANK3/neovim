return {
    "https://github.com/epwalsh/obsidian.nvim",
    enabled = vim.env.NOTES_ENABLE == 1,
    ft = "markdown",
    dependencies = {
        -- Required
        "nvim-lua/plenary.nvim",

        -- Autocomplete
        "hrsh7th/nvim-cmp",
        -- Picker
        "nvim-telescope/telescope.nvim",
        -- Syntax
        "nvim-treesitter/nvim-treesitter",
        -- Pomo timer
        -- "epwalsh/pomo.nvim"
    },
    config = {
        workspaces = {
            {
                name = "thoth",
                path = "~/Sync/bidirectional/Thoth",
                overrides = {
                    notes_subdir = "Zettelkasten"
                }
            },
            {
                name = "dynamic_vault",
                path = function()
                    return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
                end,
                overrides = {
                    notes_subdir = vim.NIL,
                    new_notes_location = "current_dir",
                    templates = {
                        folder = vim.NIL,
                    },
                    -- disable_frontmatter = true
                }
            }
        }
    }
}
