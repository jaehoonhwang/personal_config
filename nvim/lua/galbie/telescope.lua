local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local action_state = require("telescope.actions.state")
local sorters = require("telescope.sorters")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local builtins = require("telescope.builtin")

require("telescope").setup({
  defaults = {
    file_sorter = sorters.get_fzy_sorter,
    prompt_prefix = " >",
    color_devicons = true,

    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,

    mappings = {
      i = {
        ["<C-q>"] = actions.send_to_qflist,
      },
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
})

local options = { noremap = true }
vim.keymap.set("n", "<C-p>", ":Telescope<CR>", options)
vim.keymap.set("n", "<Leader>ts", builtins.grep_string, options)
vim.keymap.set("n", "<Leader>tg", builtins.git_files, options)
vim.keymap.set("n", "<Leader>tf", builtins.find_files, options)
vim.keymap.set("n", "<Leader>tb", builtins.buffers, options)
vim.keymap.set("n", "<Leader>tvh", builtins.help_tags, options)
