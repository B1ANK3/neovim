-- WARNING: DAP is not setup fully bc i haven't needed any of its functionality
-- This contains the most basic setup for dapui 
-- Stuff like auto opening debug windows etc
-- check this for more complicated setups:
-- https://github.com/rcarriga/nvim-dap-ui 

return {
  "rcarriga/nvim-dap-ui",
  dependencies = {"mfussenegger/nvim-dap"},
  init = function ()
    vim.notify("nvim-dap-ui has not been fully setup yet", 3)
  end,
  config = function ()
    local dap, dapui = require("dap"), require("dapui")

    dap.listeners.after.event_initialized['dapui_config'] = function ()
      dapui.open()
    end
    dap.listeners.before.event_terminated['dapui_config'] = function ()
      dapui.close()
    end
    dap.listeners.before.event_exited['dapui_config'] = function ()
      dapui.close()
    end

    dapui.setup()
  end
}

