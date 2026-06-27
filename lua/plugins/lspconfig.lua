return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  config = function()
    -- Ensure language servers are discoverable on your $PATH.
    -- You can check how to set each one up using :h lspconfig-all
    local servers = {
      lua_ls = {},
      clangd = {},
    }
    for server, config in pairs(servers) do
	    vim.lsp.enable(server)
	    -- vim.lsp.config(server, config)
    end
  end,
}
