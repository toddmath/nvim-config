local builtin = require('telescope.builtin')


require("telescope").setup {}

require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

local fb = require("telescope").extensions.file_browser.file_browser

vim.keymap.set('n', '<leader>fb', fb)
