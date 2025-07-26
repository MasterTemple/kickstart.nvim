-- TODO: I think this is all broken

vim.g.cursor_location_center = true
vim.g.cursor_location_top = false

-- auto-place cursor
vim.api.nvim_create_autocmd('CursorMoved', {
  callback = function()
    if vim.g.cursor_location_center == true then
      vim.cmd [[normal! zz]]
    end
    if vim.g.cursor_location_top == true then
      vim.cmd [[normal! zt]]
    end
  end,
})

local map = function(keys, func, desc)
  vim.keymap.set({ 'n', 'v' }, keys, func, { desc = desc })
end

-- toggle cursor location center
map('<leader>cc', '<cmd>lua vim.g.cursor_location_center = not vim.g.cursor_location_center<CR>', 'Toggle Cursor Location: Center')
-- toggle cursor location top
map('<leader>ct', '<cmd>lua vim.g.cursor_location_top = not vim.g.cursor_location_top<CR>', 'Toggle Cursor Location: Top')
