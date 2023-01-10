require("toddmath.set")
require("toddmath.remap")
require("toddmath.packer")

-- local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })


local augroup = vim.api.nvim_create_augroup
local ToddMathGroup = augroup('ToddMath', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', { clear = true })

function R(name)
    require("plenary.reload").reload_module(name)
end

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 100
--            timeout = 40,
        })
    end,
})

autocmd({ "BufWritePre" }, {
    group = ToddMathGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
