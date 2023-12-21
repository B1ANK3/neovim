return {
  "neovim/nvim-lspconfig",
  dependencies = {"williamboman/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp" },
  init = function ()
    -- TODO: Create keymaps 

    require("core.utils").lazy_load_on_bufent("nvim-lspconfig")

    -- LspAttach creates the keymaps AFTER the lsp is created and attached
   --[[ vim.api.nvim_create_autocmd({"LspAttach"}, {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function (ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = { buffer = ev.buf }

       
      end
    }) ]]--
  end,
  config = function ()
    -- NOTE: setup lsp servers in mason-lspconfig to avoid creating multiple servers 
		
	--[[	local lsp_cap = require("cmp_nvim_lsp").default_capabilities()
	local lsp_att = function (client, bufnr)
		local bufopts = { noremap = true, silent = true, buffer = bufnr }

		vim.keymap.set("n", 'K', vim.lsp.buf.hover, bufopts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	end

	local lspconfig = require('lspconfig')

	lspconfig['tsserver'].setup({
			capabilities = lsp_cap,
			on_attach = lsp_att
		
})
		]]--

	local load_keymap = function (map_opts)
		 require("core.utils").load_mappings({
          n = {
            ["gD"] = { function ()
              vim.lsp.buf.declaration()
            end, "LSP declaration" },
            ["gd"] = { function ()
              vim.lsp.buf.definition()
            end, "LSP definition" },
    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "LSP implementation",
    },

    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },

    ["<leader>D"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "LSP definition type",
    },

    -- ["<leader>ra"] = {
      -- function()
        -- require("nvchad.renamer").open()
      -- end,
      -- "LSP rename",
    -- },

    -- ["<leader>ca"] = {
      -- function()
        -- vim.lsp.buf.code_action()
      -- end,
      -- "LSP code action",
    -- },

    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "LSP references",
    },

    ["<leader>lf"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Goto prev",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Goto next",
    },

    ["<leader>q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "Diagnostic setloclist",
    },

    ["<leader>wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "Add workspace folder",
    },

    ["<leader>wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "Remove workspace folder",
    },

    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders",
    },

          }
        }, map_opts)

	end

	local lsp_attach = function (client, bufnr)
		local buf_opts = { noremap = true, silent = true, buffer = bufnr }
		load_keymap(buf_opts)
	end

    local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Automatic LSP installer and setup 
    -- check :h mason-lspconfig-automatic-server-setup
    require("mason-lspconfig").setup_handlers({
      -- default setup for installed lsps
      function (server_name)
        require("lspconfig")[server_name].setup({
			on_attach = lsp_attach,
			capabilities = lsp_capabilities
		})
      end,
    })
	
  end
}

