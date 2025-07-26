return {
  {
    'folke/flash.nvim',
    -- event = "VeryLazy",
    lazy = false,
    ---@type Flash.Config
    opts = {
      labels = 'asdfghjklqwertyuiopzxcvbnm1234890',
      label = {
        uppercase = false,
        after = false,
        before = true,
        rainbow = {
          enabled = true,
          -- number between 1 and 9
          shade = 5,
        },
      },
      modes = {
        search = {
          enabled = true,
        },
        char = {
          enabled = false,
        },
      },
    },
    keys = {
      {
        '<leader>v',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').treesitter()
        end,
        desc = 'Flash Treesitter',
      },
    },
  },
}
