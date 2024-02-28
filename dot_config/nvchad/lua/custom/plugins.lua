local M = {
  { "tpope/vim-repeat" },
  { "sindrets/diffview.nvim" },
  { "elkowar/yuck.vim" },
  {
    "imNel/monorepo.nvim",
    config = function()
      require("monorepo").setup {
        -- Your config here!
      }
    end,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "renerocksai/telekasten.nvim",
    event = "CmdlineEnter",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "renerocksai/calendar-vim",
      "nvim-telescope/telescope-media-files.nvim",
    },
    config = function()
      require("telekasten").setup {
        home = vim.fn.expand "~/work/notes/",
      }
    end,
  },
  {
    "kylechui/nvim-surround",
    config = function() require("nvim-surround").setup() end,
  },
  {
    "phaazon/hop.nvim",
    config = function() require("hop").setup() end,
  },
  {
    "imNel/monorepo.nvim",
    config = function() require("monorepo").setup() end,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "TimUntersberger/neogit",
    requires = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    config = function()
      require("neogit").setup {
        disable_commit_confirmation = true,
        integrations = {
          diffview = true,
        },
        commit_popup = {
          kind = "floating",
        },
      }
    end,
  },
  {
    "mattn/emmet-vim",
  },
  {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
  },
  {
    "mxsdev/nvim-dap-vscode-js",
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      require("dap-vscode-js").setup {
        debugger_path = os.getenv "HOME" .. "/.local/share/nvim/lazy/vscode-js-debug",
        adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
      }
    end,
  },
  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function() require("trouble").setup() end,
  },
  { "folke/neodev.nvim", opts = {} },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  },
}

return M
