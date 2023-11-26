local plugins = {
  {
    "Civitasv/cmake-tools.nvim"
  },
  {
    "neovim/nvim-lspconfig",
    config = function() 
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd"
      }
    }
  }
}
return plugins
