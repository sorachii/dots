return {
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = "light"
      vim.cmd.colorscheme("forestbones")
    end,
  },

  {
    "EdenEast/nightfox.nvim",
    lazy = true,
  },

  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
  },
}
