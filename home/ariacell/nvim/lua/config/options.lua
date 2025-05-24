local opt = vim.opt

-- Tabs and indentation
opt.expandtab = true       -- Use spaces instead of tabs
opt.shiftwidth = 4         -- Size of indent
opt.tabstop = 4            -- Number of spaces per tab
opt.softtabstop = 4        -- Spaces inserted when pressing tab

-- UI
opt.number = true          -- Show absolute line numbers
opt.relativenumber = true  -- Show relative line numbers
opt.cursorline = true      -- Highlight current line
opt.termguicolors = true   -- Enable true color support
