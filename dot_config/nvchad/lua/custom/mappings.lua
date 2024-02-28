local M = {}

M.disabled = {
  n = {
    ['<C-e>'] = ''
  }
}

M.ced = {
  n = {
    -- second key is the lefthand side of the map
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["[q"] = { "<cmd>cprevious<cr>", desc = "Previous Quickfix Item" },
    ["]q"] = { "<cmd>cnext<cr>", desc = "Next Quickfix Item" },
    ["<leader><tab>"] = { "<cmd>Other<cr>", desc = "Jump to 'other' file" },
    ["<leader>w"] = nil, -- used to be "save"
    ["<leader>s"] = { "<cmd>wall<cr>", desc = "Save all files" },
    ["<leader>x"] = { "<cmd>qa<cr>", desc = "Quit neovim" },
    -- ["[<space>"] = {
    --   function() require("user.custom.unimpaired").paste_blank_line_above() end,
    --   desc = "Paste blank line above",
    -- },
    -- ["]<space>"] = {
    --   function() require("user.custom.unimpaired").paste_blank_line_below() end,
    --   desc = "Paste blank line below",
    -- },
    --
    -- buffers
    --
    ["<leader><leader>"] = { function() require("telescope.builtin").buffers() end, desc = "Find buffers" },
    --
    -- Miscellaneous and overrides
    --
    -- ["<leader>rr"] = { function() require("ranger-nvim").open(true) end, desc = "Open Ranger" },
    -- ["<leader>fe"] = {
    --   function() require("neo-tree.command").execute { action = "focus", toggle = true } end,
    --   desc = "Open NeoTree",
    -- },

    -- ["<leader>fg"] = {
    --   function() require("neo-tree.command").execute { action = "focus", toggle = true, source = "git_status" } end,
    --   desc = "Open NeoTree (Git)",
    -- },
    --
    -- window management/navigation
    --
    -- ["<C-h>"] = { function() require("smart-splits").move_cursor_left() end, desc = "Move to left split" },
    -- ["<C-j>"] = { function() require("smart-splits").move_cursor_down() end, desc = "Move to below split" },
    -- ["<C-k>"] = { function() require("smart-splits").move_cursor_up() end, desc = "Move to above split" },
    -- ["<C-l>"] = { function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" },

    --
    -- Jump
    --
    -- ["<leader>j"] = { name = "↗ Jump" },
    -- ["<leader>jb"] = { "<cmd>HopWordBC<cr>", desc = "Before Cursor" },
    -- ["<leader>jj"] = { "<cmd>HopLineAC<cr>", desc = "Line downwards" },
    -- ["<leader>jl"] = { function() require("harpoon.ui").toggle_quick_menu() end, desc = "List marks" },
    -- ["<leader>jk"] = { "<cmd>HopLineBC<cr>", desc = "Line upwards" },
    -- ["<leader>jo"] = { "<cmd>Telescope treesitter theme=ivy<cr>", desc = "Symbols" },
    -- ["<leader>jw"] = { "<cmd>HopWordAC<cr>", desc = "Word" },
    -- ["<leader>jp"] = { function() require("telescope").extensions.monorepo.monorepo() end, desc = "Monorepo Project" },
    --
    -- Harpooning
    --
    -- ["<M-m>"] = { function() require("harpoon.mark").add_file() end, desc = "Mark file" },
    -- ["<M-1>"] = { function() require("harpoon.ui").nav_file(1) end, desc = "Move to file 1" },
    -- ["<M-2>"] = { function() require("harpoon.ui").nav_file(2) end, desc = "Move to file 2" },
    -- ["<M-3>"] = { function() require("harpoon.ui").nav_file(3) end, desc = "Move to file 3" },
    -- ["<M-4>"] = { function() require("harpoon.ui").nav_file(4) end, desc = "Move to file 4" },
    --
    -- Test
    --
    -- ["<leader>t"] = { name = "Test" },
    -- ["<leader>tN"] = { "<cmd>lua require('neotest').run.run({strategy='dap'})<cr>", desc = "Debug nearest test" },
    -- ["<leader>tf"] = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "File" },
    -- ["<leader>ti"] = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", desc = "Info" },
    -- ["<leader>tj"] = { "<cmd>lua require('neotest').jump.next()<cr>", desc = "Jump to next test" },
    -- ["<leader>tk"] = { "<cmd>lua require('neotest').jump.prev()<cr>", desc = "Jump to prev test" },
    -- ["<leader>tn"] = { "<cmd>lua require('neotest').run.run()<cr>", desc = "Nearest" },
    -- ["<leader>ts"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Sumamry" },
    --
    -- Git
    --
    -- ["<leader>ga"] = { function() require("gitsigns").stage_hunk() end, desc = "Stage Git hunk" },
    -- ["<leader>gA"] = { function() require("gitsigns").stage_buffer() end, desc = "Stage Git buffer" },
    -- ["<leader>gs"] = { function() require("neogit").open { kind = "split" } end, desc = "Stage Git buffer" },
    -- ["<leader>gm"] = { function() require("neogit").open { "commit" } end, desc = "Stage Git buffer" },
    --
    -- LSP
    --
    -- ["<leader>lt"] = { function() require("trouble").toggle() end, desc = "Trouble toggle" },
    ["<leader>lo"] = {
      function()
        vim.lsp.buf.execute_command { command = "_typescript.organizeImports", arguments = { vim.fn.expand "%:p" } }
      end,
      desc = "Organize Imports (nodejs)",
    },
  }





}



return M