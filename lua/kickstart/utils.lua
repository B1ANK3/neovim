-- [[ Utility functions ]]
--
local export = {}

export.lazy_load_on_bufent = function (plugin) 
    vim.api.nvim_create_autocmd({"BufRead", "BufWinEnter", "BufNewFile"}, {
        group = vim.api.nvim_create_augroup("BeLazyOnFileOpen"..plugin, {}),
        callback = function()
            -- Buffer path (if exists)
            local file = vim.fn.expand('%')
            local needs_lsp = file ~= "" and file ~= "[Wilder Float 0]" -- empty file

            if needs_lsp then
                vim.api.nvim_del_augroup_by_name("BeLazyOnFileOpen"..plugin)

                -- Tree sitter should load as soon as possible
                if plugin ~= "nvim-treesitter" then
                    vim.schedule(function()
                        require('lazy').load({plugins=plugin})
                        if plugin == "nvim-lspconfig" then
                            -- Loads the filetype for lspconfig
                            vim.cmd("silent! do FileType")
                        end
                    end)
                else
                    require('lazy').load({plugins=plugin})
                end
            end
        end
    })
end

return export
