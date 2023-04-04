local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = { "python" },
  },
  ensure_installed = {
    "c",
    "cpp",
    "css",
    "go",
    "html",
    "java",
    "lua",
    "markdown",
    "proto",
    "python",
    "regex",
    "rust",
    "tsx",
    "vim",
    "toml",
    "yaml",
  },
  autotag = {
    enable = true,
  },
}

require("nvim-treesitter.configs").setup {
  yati = {
    enable = true,
    disable = { "python", "lua" },
    default_lazy = false,
    default_fallback = function() return -1 end, -- provide custom fallback indent method
  }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
