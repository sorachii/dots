return {
  -- Multi-file diffs across commits/branches + 3-way merge-conflict resolver
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Diffview: open" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", desc = "Diffview: file history" },
      { "<leader>gH", "<cmd>DiffviewFileHistory<CR>", desc = "Diffview: repo history" },
      { "<leader>gx", "<cmd>DiffviewClose<CR>", desc = "Diffview: close" },
    },
    opts = {},
  },

  -- Magit-style staging / commit / rebase UI (uses diffview for its diffs)
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim", -- optional picker integration
    },
    keys = {
      { "<leader>gg", "<cmd>Neogit<CR>", desc = "Neogit: status" },
      { "<leader>gc", "<cmd>Neogit commit<CR>", desc = "Neogit: commit" },
    },
    opts = {
      integrations = { diffview = true, telescope = true },
    },
  },
}
