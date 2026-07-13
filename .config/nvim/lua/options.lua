-- Leader
vim.g.mapleader        = " "
vim.g.maplocalleader   = " "

-- Line numbers
vim.opt.number         = true
vim.opt.relativenumber = true

-- Tabs
vim.opt.shiftwidth     = 4
vim.opt.tabstop        = 4
vim.opt.softtabstop    = 4
vim.opt.expandtab      = false

-- Colorscheme
vim.cmd.colorscheme    "sorbet"

-- Fix popup windows not following colorscheme
vim.api.nvim_set_hl(0, "FloatBorder", { link = "NeoTreeFloatBorder" })
vim.api.nvim_set_hl(0, "NormalFloat", { link = "NeoTreeNormal"      })

-- Persistent Undo History
vim.opt.undofile       = true

-- Remove mouse controls
vim.opt.mouse          = ""
