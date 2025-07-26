local map = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = desc })
end

----------
-- Misc --
----------

map('Y', 'v$hy', 'Yank to the end of the line')

map('<M-k>', ':m .-2<CR>', 'Move up')
map('<M-j>', ':m .+1<CR>', 'Move down')

map('<M-p>', ':cprev<CR>', 'Quick switcher (prev)')
map('<M-n>', ':cnext<CR>', 'Quick switcher (next)')

map('<leader>li', '<cmd>lua vim.diagnostic.open_float()<CR>', 'Show LSP Info')
map('<leader>in', '<cmd>Telescope symbols<CR>', 'Insert Greek letter')
-- fix typo
map('<leader>tp', '<cmd>Telescope spell_suggest<CR>', 'Fix typo')

map('<S-h>', ':bprev<CR>', 'Previous tab')
map('<S-l>', ':bnext<CR>', 'Next tab')

map('<A-h>', ':lua require("harpoon.ui").nav_prev()<CR>', 'Harpoon: Previous')
map('<A-l>', ':lua require("harpoon.ui").nav_next()<CR>', 'Harpoon: Next')

---------------
-- Telescope --
---------------

map('<leader>ob', ':Telescope bookmarks<CR>', 'Open Bookmark')

----------
-- TMUX --
----------

-- handled currently inside the plugin file
-- map('<C-h>', ':TmuxNavigateLeft<CR>', 'window left')
-- map('<C-l>', ':TmuxNavigateRight<CR>', 'window right')
-- map('<C-j>', ':TmuxNavigateDown<CR>', 'window down')
-- map('<C-k>', ':TmuxNavigateUp<CR>', 'window up')
-- map('<C-t>', ':silent !tmux new-window<CR>', 'New window')

----------
-- Rust --
----------

map('<leader>re', '<cmd>lua require("ferris.methods.expand_macro")() <CR>', 'Expand Rust macro recursively')

----------
-- Case --
----------

-- case: snake -> Pascal
map(
  '<leader>csp',
  "\"aciw<C-c>:let @a=substitute(@a, '\\l', '\\u&', '')|let @a=substitute(@a, '\\v_(\\l)', '\\u\\1', 'g')|norm \"ap<CR>",
  'snake_case -> PascalCase'
)
-- `PascalCase` -> `snake_case`
map(
  '<leader>cps',
  "\"aciw<C-c>:let @a=substitute(@a, '\\u', '\\l\\0', '') | let @a=substitute(@a, '\\u', '_\\l\\0', 'g')|norm \"ap<CR>",
  '`PascalCase` -> `snake_case`'
)
-- `camelCase` -> `snake_case`
map(
  '<leader>ccs',
  "\"aciw<C-c>:let @a=substitute(@a, '\\b\\u', '\\l\\0', '') | let @a=substitute(@a, '\\u', '_\\l\\0', 'g')|norm \"ap<CR>",
  '`camelCase` -> `snake_case`'
)
-- `snake_case` -> `camelCase`
map('<leader>csc', "\"aciw<C-c>:let @a=substitute(@a, '\\v_(\\l)', '\\u\\1', 'g')|norm \"ap<CR>", '`snake_case` -> `camelCase`')
-- `snake_case` -> `PascalCase`
map(
  '<leader>csp',
  "\"aciw<C-c>:let @a=substitute(@a, '\\l', '\\u\\0', '') | let @a=substitute(@a, '\\v_(\\l)', '\\u\\1', 'g')|norm \"ap<CR>",
  '`snake_case` -> `PascalCase`'
)
-- `PascalCase` -> `camelCase`
map('<leader>cpc', "\"aciw<C-c>:let @a=substitute(@a, '\\u', '\\l\\0', '')|norm \"ap<CR>", '`PascalCase` -> `camelCase`')
-- `camelCase` -> `PascalCase`
map('<leader>ccp', "\"aciw<C-c>:let @a=substitute(@a, '\\l', '\\u\\0', '')|norm \"ap<CR>", '`camelCase` -> `PascalCase`')

---------
-- LSP --
---------

-- I can't use <C-[>
-- map("<C-}>",  '<cmd>lua vim.diagnostic.goto_prev()<CR>', "To to prev error/warning/hint" )
-- map("<C-],  '<cmd>lua vim.diagnostic.goto_next()<CR>', "To to next error/warning/hint" )

--------------
-- Obsidian --
--------------

map('<leader>oqs', '<cmd>ObsidianQuickSwitch<CR>', '[Q]uick [S]witch')
map('<leader>orf', '<cmd>ObsidianRename<CR>', '[R]ename [F]ile')
map('<leader>oit', '<cmd>ObsidianTemplate<CR>', '[I]nsert [T]emplate')
map('<leader>ont', '<cmd>ObsidianNewFromTemplate<CR>', '[N]ew Note From [T]emplate')
map('<leader>otc', '<cmd>ObsidianTOC<CR>', 'Search [T]able of [C]ontents')
map('<leader>osd', '<cmd>ObsidianDailies<CR>', '[S]earch [D]aily Notes')
map('<leader>odn', '<cmd>ObsidianToday<CR>', 'Open [D]aily [N]ote')
map('<leader>ody', '<cmd>ObsidianYesterday<CR>', 'Open [D]aily Note ([Y]esterday)')
map('<leader>odt', '<cmd>ObsidianTomorrow<CR>', 'Open [D]aily Note [T]omorrow')
map('<leader>osb', '<cmd>ObsidianBacklinks<CR>', '[S]earch [B]ack Links')
map('<leader>ost', '<cmd>ObsidianTags<CR>', '[S]earch [T]ags')
map('<leader>osl', '<cmd>ObsidianLinks<CR>', '[S]earch [L]inks')
map('<leader>opi', '<cmd>ObsidianPasteImg<CR>', '[P]aste [I]mage')

map('<leader>ha', ':lua require("harpoon.mark").add_file()<CR>', 'Harpoon: Add')
map('<leader>hp', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', 'Harpoon: Menu')
