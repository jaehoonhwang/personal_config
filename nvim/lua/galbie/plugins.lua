local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  -- Your plugins go here
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  -- Make NerdTreee file look nice
  use 'ryanoasis/vim-devicons'
  -- Distraction free setting
  use 'junegunn/goyo.vim'
  -- Color scheme
  use 'flazz/vim-colorschemes'
  use 'morhetz/gruvbox'

  -- Functionalities
  -- * git
  use 'tpope/vim-fugitive'
  -- git diff viewer
  -- use 'airblade/vim-gitgutter'
  -- super nocompatible
  use 'tpope/vim-sensible'
  -- auto surrounds for things
  use 'tpope/vim-surround'
  -- tagbar
  use 'majutsushi/tagbar'
  -- tree file structures
  -- use 'scrooloose/nerdtree'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  -- comment
  use 'scrooloose/nerdcommenter'
  -- More stuff
  use 'jiangmiao/auto-pairs'
  -- HTML close tag
  use 'alvan/vim-closetag'
  -- indent line
  --use 'Yggdroot/indentLine'
  -- Syntax highlighting
  use 'nvim-treesitter/nvim-treesitter'
  -- use "yioneko/nvim-yati"
  -- bullet stuff
  -- use 'dkarter/bullets.vim'
  --
  use 'mbbill/undotree'
  use 'windwp/nvim-ts-autotag'
  use 'windwp/nvim-autopairs'

  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'BurntSushi/ripgrep'
  use 'sharkdp/fd'

  -- Langauge Server for your definition needs
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'onsails/lspkind-nvim'
  use 'glepnir/lspsaga.nvim'
  -- -- cmp
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  -- snip
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Prettier
  use 'sbdchd/neoformat'
  -- linter
  --use 'jose-elias-alvarez/null-ls.nvim'
end)
