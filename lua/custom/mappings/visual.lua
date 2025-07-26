local map = function(keys, func, desc)
  vim.keymap.set('v', keys, func, { desc = desc })
end

-- map('<leader>/', ':norm gc', 'Yank to the end of the line')

map('*', 'y/\\V<C-r>"<CR>', 'Search for selection (forward)')
map('#', 'y?\\V<C-r>"<CR>', 'Search for selection (backward)')

map('<M-k>', ":'<m -2 | norm '>V'<<CR>", 'Move up')
map('<M-j>', ":'>m '>+1 | norm '<V'><CR>", 'Move down')
