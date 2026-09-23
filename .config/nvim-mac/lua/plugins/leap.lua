return {
  {
    "leap.nvim",
    url = "https://codeberg.org/andyg/leap.nvim",
    dependencies = { "tpope/vim-repeat" }, -- makes `.` repeat leap motions
    event = "VeryLazy",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
}
