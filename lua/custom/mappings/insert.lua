local map = function(keys, func, desc)
  vim.keymap.set('i', keys, func, { desc = desc })
end

----------
-- Misc --
----------

-- map('jk', '<Esc>', 'Enter normal mode')

