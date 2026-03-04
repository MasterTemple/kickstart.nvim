-- For `plugins/markview.lua` users.
return {
  'OXY2DEV/markview.nvim',
  lazy = false,
  opts = {
    -- enable_hybrid_mode = true,
    typst = {
      enable = false,
    },
    markdown = {
      -- https://github.com/OXY2DEV/markview.nvim/wiki/Markdown#list_items
      list_items = {
        enable = true,
        wrap = true,
        shift_width = 1,
        indent_size = 0,
        marker_minus = {
          add_padding = true,
          conceal_on_checkboxes = true,

          text = '-',
          hl = 'MarkviewListItemMinus',
        },
      },
      -- enable_hybrid_mode = true,
      block_quotes = {
        enable = true,
        wrap = true,
        ['bible'] = {
          hl = 'MarkviewBlockQuoteNote',
          preview = ' Bible',
          title = true,
          icon = '',
        },
        ['cf'] = {
          hl = '@module.builtin',
          preview = ' Cross-Reference',
          title = true,
          icon = '',
        },
        ['x'] = {
          hl = '@conceal',
          preview = ' Twitter',
          title = true,
          icon = '',
        },
        ['pdf|yellow'] = {
          icon = '',
          hl = '@comment.warning',
          title = true,
          preview = ' PDF (Yellow)',
        },
        ['pdf|red'] = {
          icon = '',
          hl = '@comment.error',
          title = true,
          preview = ' PDF (Red)',
        },
        ['pdf|note'] = {
          icon = '',
          hl = '@comment.todo',
          title = true,
          preview = ' PDF (Note)',
        },
        ['pdf|important'] = {
          icon = '',
          hl = '@keyword.function',
          title = true,
          preview = ' PDF (Important)',
        },
      },
    },
    preview = {
      enable_hybrid_mode = true,
      hybrid_modes = { 'n', 'no', 'c' },
      linewise_hybrid_mode = true,
      edit_range = { 0, 0 },
    },
  },

  -- Completion for `blink.cmp`
  -- dependencies = { "saghen/blink.cmp" },
}
