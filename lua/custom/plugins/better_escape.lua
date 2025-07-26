return {
  {
    'max397574/better-escape.nvim',
    mappings = {
      -- i for insert, other modes are the first letter too
      i = {
        j = {
          k = '<Esc>',
        },
      },
    },
    config = function()
      require('better_escape').setup()
    end,
  },
}
