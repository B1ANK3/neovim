-- WARNING: Module not setup entirely
-- Missing keymaps
-- check this for full config: https://github.com/mfussenegger/nvim-dap/blob/master/doc/dap.txt
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
-- DAP can support VSCode launchjsons

return {
 "mfussenegger/nvim-dap",
  init = function ()
    require("core.utils").load_mappings({
      n = {
        ["<F5>"] = {
          function ()
            -- get path to current buffer file 
            local json = vim.fn.getcwd() .. '/.vscode/launch.json'
            -- vim.notify("Looking for launch.json: " .. json, 3)
            if vim.fn.filereadable(json) then
              require("dap.ext.vscode").load_launchjs()
            end
            require("dap").continue()
          end,
          "Debug start/continue"
        },
        ["<F10>"] = {
          function ()
            require("dap").step_over()
          end,
          "Debug step over"
        },
        ["<F11>"] = {
          function ()
            require("dap").step_into()
          end,
          "Debug step into"
        },
        ["<F12>"] = {
          function ()
            require("dap").step_out()
          end,
          "Debug step out"
        },
        ["<leader>b"] = {
          function ()
            require("dap").toggle_breakpoint()
          end,
          "Debug toggle breakpoint"
        },
        ["<leader>B"] = {
          function ()
            require("dap").set_breakpoint()
          end,
          "Debug set breakpoint"
        },
        ["<leader>lp"] = {
          function ()
            require("dap").set_breakpoint(nil, nil, vim.fn.import("Log point message: "))
          end,
          "Debug log point"
        },
        ["<leader>dr"] = {
          function ()
            require("dap").repl.open()
          end,
          "Debug repl open"
        },
        ["<leader>dl"] = {
          function ()
            require("dap").run_last()
          end,
          "Debug run last"
        },
        ["<leader>dh"] = {
          function ()
            require("dap.ui.widgets").hover()
          end,
          "Debug hover"
        },
        ["<leader>dp"] = {
          function ()
            require("dap.ui.widgets").preview()
          end,
          "Debug preview"
        },
        ["<leader>df"] = {
          function ()
            local widgets = require("dap.ui.widgets")
            widgets.centered_float(widgets.frames)
          end,
          "Debug window frames float center"
        },
        ["<leader>ds"] = {
          function ()
            local widgets = require("dap.ui.widgets")
            widgets.centered_float(widgets.scope)
          end
        }
      },

      v = {
        ["<leader>dh"] = {
          function ()
            require("dap.ui.widgets").hover()
          end,
          "Debug hover"
        },
        ["<leader>dp"] = {
          function ()
            require("dap.ui.widgets").preview()
          end,
          "Debug preview"
        }
      }
    })
  end,
  config = function ()
    local dap = require("dap")

    -- default use external terminal 
    dap.defaults.fallback.force_external_terminal = true
  end
}

