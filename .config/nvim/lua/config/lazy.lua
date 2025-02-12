-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {
	    'nvim-telescope/telescope.nvim', tag = '0.1.8',
	    dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
	    "oxfist/night-owl.nvim",
	    lazy = false, -- make sure we load this during startup if it is your main colorscheme
	    priority = 1000, -- make sure to load this before all the other start plugins
	    config = function()
		    -- load the colorscheme here
		    require("night-owl").setup()
		    vim.cmd.colorscheme("night-owl")
	    end,
    },
    {{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}},
    { 'nvim-treesitter/playground' },
    {
	    "ThePrimeagen/harpoon",
	    branch = "harpoon2",
	    dependencies = { "nvim-lua/plenary.nvim" }
    },
    { 'mbbill/undotree' },
    { 'tpope/vim-fugitive' },
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
  },
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
