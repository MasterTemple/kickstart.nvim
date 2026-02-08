return {
  -- "MasterTemple/mkmv.nvim",
  dir = '/home/dgmastertemple/Dropbox/Development/lua/mkmv',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  lazy = false,
  config = function()
    require('mkmv').setup {
      rename_on_move = false,
      rename_include_extension = false,
      write_empty_file_on_create = true,
      -- TODO: I have the keybindings specified in another file, because I wanted to add the description using vim.keymap.set; but it is probably more organized for me to do it here
      mappings = {
        create_file = '<leader>fn',
        move_file = '<leader>fm',
      },
    }

    -- map('<leader>fn', ':CreateInFolder<CR>', '[F]ile [N]ew')
    --         map('<leader>fm', ':MoveToFolder<CR>', '[F]ile [M]ove')
    -- vim.keymap.set('n', '<leader>fn', ':CreateInFolder<CR>', { desc = '[F]ile [N]ew' })
    -- vim.keymap.set('n', '<leader>fm', ':MoveToFolder<CR>', { desc = '[F]ile [M]ove' })
  end,
}
