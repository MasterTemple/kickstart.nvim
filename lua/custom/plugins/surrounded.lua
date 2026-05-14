-- lazy.nvim specification
-- return {
--   {
--     -- dir = vim.fn.stdpath("config") .. "/lua/easy-surround", -- Points to your local file
--     -- dir = '/home/dgmastertemple/Dropbox/Development/lua/surrounded',
--     -- dir = '/home/dgmastertemple/Dropbox/Development/lua/surrounded.nvim',
--     -- name = 'surrounded',
--     -- lazy = false,
--     -- config = function()
--     --   require('surrounded').setup {
--     --     surround = 'S',
--     --     padding = { ' ' },
--     --     units = {
--     --       '*',
--     --       '**',
--     --       '==',
--     --       '_',
--     --       '__',
--     --       { key = '=', delimeter = '==' },
--     --       { delimeter = '|', pad = ' ' },
--     --     },
--     --     pairs = {
--     --       { open = '[', close = ']' },
--     --       { open = '(', close = ')' },
--     --       { open = '{', close = '}' },
--     --       { open = "'", close = "'" },
--     --       { open = '"', close = '"' },
--     --       -- Remember to use close instead of end!
--     --       { key = '[', open = '[ ', close = ' ]' },
--     --     },
--     --   }
--     -- end,
--     dir = '/home/dgmastertemple/Dropbox/Development/lua/surrounded-claude',
--     config = function()
--       require('surrounded').setup() -- all defaults
--     end,
--   },
-- }
return {
  -- 'MasterTemple/surrounded.nvim',
  dir = '/home/dgmastertemple/Dropbox/Development/lua/surrounded-claude',
  event = 'VeryLazy',
  opts = {},
}
