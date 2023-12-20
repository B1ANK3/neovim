local export = {}

local function table_to_string(tbl)
    local result = "{"
    for k, v in pairs(tbl) do
        -- Check the key type (ignore any numerical keys - assume its an array)
        if type(k) == "string" then
            result = result.."[\""..k.."\"]".."="
        end

        -- Check the value type
        if type(v) == "table" then
            result = result..table_to_string(v)
        elseif type(v) == "boolean" then
            result = result..tostring(v)
        elseif type(v) == "function" then
            result = result.."__function__"
        else
            result = result.."\""..v.."\""
        end
        result = result..","
    end
    -- Remove leading commas from the result
    if result ~= "{" then
        result = result:sub(1, result:len()-1)
    end
    return result.."}"
end

local function load_plugins()
  local plugin_path = vim.fn.stdpath('config') .. "/lua/plugins/"
  local plugin_files = vim.fn.readdir(plugin_path, [[v:val =~ '\.lua$']])
  local plugins = {}

  for i, file in ipairs(plugin_files) do
    local spec = require("plugins." .. file:gsub('%.lua$', ''))

    -- lazy spec for loading
    plugins[i] = { spec }
  end

  return plugins
end

export.load_config = function ()
  local config = {}
  config.lazy_config = require("core.lazy")
  config.plugins = load_plugins()
  -- keep cache of all defined mappings
  config.mappings = {}
  -- load_mappings(require("core.mappings"))

  return config
end

-- local mappings = require("core.mappings")
export.load_mappings = function (map, map_opts)
  vim.schedule(function ()

    local mappings = require("core.utils").load_config().mappings

    local opts = map_opts or {}
    -- vim.notify(table_to_string(map))
    for mode, mode_values in pairs(map) do
      for keybind, mapping_info in pairs(mode_values) do
        -- check if bind already exists
        -- if mappings[keybind] then
          -- vim.notify("Existing keybind found! Overwriting: " .. mapping_info[2], 4)
        -- else
          local final_opts = vim.tbl_deep_extend("force", {desc = mapping_info[2], mode = nil}, opts)
          vim.keymap.set(mode, keybind, mapping_info[1], final_opts)
          mappings[keybind] = final_opts
          -- vim.notify("Mode: " .. mode .. " Keybind: " .. keybind)
        -- end
      end
    end
  end)
end
export.load_mappings(require('core.mappings'))

-- Load a plugin on buffer enter 
-- Usually used to load language features 
export.lazy_load_on_bufent = function (plugin)
    vim.api.nvim_create_autocmd({"BufRead", "BufWinEnter", "BufNewFile"}, {
      group = vim.api.nvim_create_augroup("BeLazyOnFileOpen" .. plugin, {}),
      callback = function ()

        -- buffer path (if exists)
        local file = vim.fn.expand("%")
        -- Ignore buffers that are not editing files
      -- empty file and wilder autocomplete
        local needs_lsp = file ~= "" and file ~= "[Wilder Float 0]" -- empty file 

        -- vim.notify(file, 3)

        if needs_lsp then
          -- remove augroup cause lsp is loaded now 
          vim.api.nvim_del_augroup_by_name("BeLazyOnFileOpen" .. plugin)

          if plugin ~= "nvim-treesitter" then
          vim.schedule(function ()
            require("lazy").load({plugins = plugin })
            if plugin == "nvim-lspconfig" then
              vim.cmd("silent! do FileType")
            end
          end)
          else
            require("lazy").load({plugins = plugin })
          end

        end
      end
    })
end


return export
