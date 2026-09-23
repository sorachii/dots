-- Isolated config. Run with: NVIM_APPNAME=nvim-mac nvim
-- Data/state/plugins live under ~/.local/share/nvim-mac, so your main
-- ~/.config/nvim is never touched.

-- Leader must be set BEFORE lazy loads so plugin keymaps bind correctly.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.options")
require("config.keymaps")

-- Bootstrap lazy.nvim (clones itself on first launch)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", repo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Load every spec file under lua/plugins/
require("lazy").setup({
  spec = { { import = "plugins" } },
  install = { colorscheme = { "forestbones", "habamax" } },
  checker = { enabled = true, notify = false }, -- background update checks
  change_detection = { notify = false },
  rocks = { enabled = false }, -- no plugins need luarocks; skips hererocks bootstrap
})
