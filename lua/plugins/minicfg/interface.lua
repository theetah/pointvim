local map = vim.keymap.set

require("mini.clue").setup()

-- Command Line
require("mini.cmdline").setup()

-- Statusline
local statusline = require("mini.statusline")
statusline.setup({
  content = {
    active = function()
      -- Default config. Same with just nil.
      local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
      local git = MiniStatusline.section_git({ trunc_width = 40 })
      local diff = MiniStatusline.section_diff({ trunc_width = 75 })
      local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
      local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
      local filename = MiniStatusline.section_filename({ trunc_width = 140 })
      local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
      local location = MiniStatusline.section_location({ trunc_width = 75 })
      local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

      return MiniStatusline.combine_groups({
        { hl = mode_hl, strings = { mode } },
        { hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
        "%<", -- Mark general truncate point
        { hl = "MiniStatuslineFilename", strings = { filename } },
        "%=", -- End left alignment
        { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
        { hl = mode_hl, strings = { search, location } },
      })
    end,
    inactive = nil,
  },
  use_icons = true,
})
-- You can configure sections in the statusline by overriding their
-- default behavior. For example, here we set the section for
-- cursor location to LINE:COLUMN
---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function()
  return "%p%%"
end

-- Tabline
require("mini.tabline").setup()
-- Tabline keymaps
map("n", "<S-l>", "<CMD>bnext<CR>", { desc = "next buffer" })
map("n", "<S-h>", "<CMD>bprevious<CR>", { desc = "previous buffer" })
map("n", "<leader>bd", "<CMD>bdelete<CR>", { desc = "delete current buffer" })

-- Pickers
require("mini.pick").setup()

map("n", "<leader>f", "<CMD>Pick files<CR>", { desc = "File picker" })
map("n", "<leader>r", "<CMD>Pick oldfiles<CR>", { desc = "Oldfiles picker" })
-- mini.extra adds many useful pickers.
require("mini.extra").setup()
-- note, below mapping might be messy when used in tandem with lazydev.
map("n", "<leader>ws", "<CMD>Pick lsp scope=\"workspace_symbol\"<CR>", { desc = "Pick LSP workspace symbols"} )
map("n", "<leader>ds", "<CMD>Pick lsp scope=\"document_symbol\"<CR>", { desc = "Pick LSP document symbols"} )
map("n", "<leader>e", "<CMD>Pick explorer<CR>", { desc = "Open an explorer"} )
-- mini.icons for picker icons
require("mini.icons").setup()
