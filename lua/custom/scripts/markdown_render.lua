-- https://chatgpt.com/c/692774e5-c7ec-8325-81c8-d2b61de15ab2

local ns = vim.api.nvim_create_namespace 'md_render'
local bufnr = vim.api.nvim_get_current_buf()

-------------------------------------------------------
-- 1. Define conceal rules using syntax matches
-------------------------------------------------------

-- A utility: define a concealed syntax match for a literal pattern
local function conceal(pattern)
  vim.cmd(('syntax match MdRenderConceal /%s/ conceal'):format(pattern))
end

local function concealers()
  -- Conceal Bible verses: `<sup>12</sup>`
  conceal '<sup>\\d\\+<\\/sup>'

  -- Conceal callouts: `[!PDF|yellow]`, `[!bible]`
  conceal '\\v\\[![A-z]+(\\|[A-z]+)?\\]'

  -- Conceal blockquote chains: `> `, `> > `
  conceal '\\v(\\> )+'
end

vim.opt_local.conceallevel = 2
-- vim.opt_local.concealcursor = 'nc'

-------------------------------------------------------
-- 2. Rules for replacement virtual text
-------------------------------------------------------

local rules = {}

local function add_rule(pattern, handler)
  table.insert(rules, { pattern = pattern, handler = handler })
end

-------------------------------------------------------
-- 3. Replacement rules
-------------------------------------------------------

-- <sup>12</sup> → 12
add_rule('<sup>%d+</sup>', function(match)
  local num = match:match '%d+' .. ' '
  -- return num, 'MdSup', nil
  return num, '@constant', nil
end)

vim.api.nvim_set_hl(0, 'MdSup', {
  fg = '#aaaaaa',
  -- italic = true,
})
--
-- -- [!PDF|yellow] → PDF
-- add_rule('%[![A-z]+|[A-z]+%]', function(match)
--   local label = match:match '!([A-z]+)'
--   return label, 'MdCallout', nil
-- end)
--
-- -- [!PDF|yellow] → PDF
-- add_rule('%[![A-z]+%]', function(match)
--   local label = match:match '!([A-z]+)%]'
--   return string.upper(label), 'MdCallout', nil
-- end)

-- [!PDF|yellow] → PDF
-- add_rule('%[![A-z]+(|[A-z]+)?%]', function(match)
add_rule('%[!%a+', function(match)
  local label = match:match '!([A-z]+)'
  label = string.lower(label)
  -- https://www.nerdfonts.com/cheat-sheet
  local icons = {
    ['pdf'] = '󰸱',
    ['bible'] = '',
    ['cf'] = '',
    ['quote'] = '',
  }
  label = icons[label] or '-'
  return label, 'MdCallout', nil
end)

vim.api.nvim_set_hl(0, 'MdCallout', {
  -- fg = '#000000',
  -- bg = '#ffd700',
  fg = '#7aa2f7',
  bold = true,
})

local embed = function(match)
  -- local depth = select(2, match:gsub('> ', ''))
  local _, depth = match:gsub('> ', '')
  -- return ('│ '):rep(depth), '@markup.heading', 0
  -- https://apps.timwhitlock.info/unicode/inspect?s=%E2%96%80%E2%96%81%E2%96%82%E2%96%83%E2%96%84%E2%96%85%E2%96%86%E2%96%87%E2%96%88%E2%96%89%E2%96%8A%E2%96%8B%E2%96%8C%E2%96%8D%E2%96%8E%E2%96%8F%E2%96%90%E2%96%91%E2%96%92%E2%96%93%E2%96%94%E2%96%95%E2%96%96%E2%96%97%E2%96%98%E2%96%99%E2%96%9A%E2%96%9B%E2%96%9C%E2%96%9D%E2%96%9E%E2%96%9F
  -- ▌
  return ('│ '):rep(depth), 'MdCalloutBar', 0
end

-- Lua cant match groups repetitively x_x
add_rule('^> [^>]', embed)
add_rule('^> > [^>]', embed)

vim.api.nvim_set_hl(0, 'MdCalloutBar', {
  fg = '#7aa2f7',
  bold = true,
})

-------------------------------------------------------
-- 4. Main renderer
-------------------------------------------------------

local function render()
  concealers()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
  local cursor_line = vim.api.nvim_win_get_cursor(0)[1]
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  for i, line in ipairs(lines) do
    if i ~= cursor_line then
      for _, r in ipairs(rules) do
        local s, e = line:find(r.pattern)
        if s then
          local txt, hl, col = r.handler(line:sub(s, e))
          vim.api.nvim_buf_set_extmark(bufnr, ns, i - 1, col or (s - 1), {
            virt_text = { { txt, hl } },
            virt_text_pos = 'inline',
            end_row = i - 1,
            end_col = e - 2,
          })
        end
      end
    end
  end
end

-------------------------------------------------------
-- 5. Autocmds
-------------------------------------------------------

vim.api.nvim_create_autocmd({ 'BufEnter', 'TextChanged', 'TextChangedI', 'CursorMoved', 'CursorMovedI' }, { callback = render, pattern = { '*.md' } })
