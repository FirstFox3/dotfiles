local set = vim.keymap.set

-- Telescope
local builtin = require("telescope.builtin")
set("n", "<leader>sf",  builtin.find_files,                { desc = "[S]earch for [f]iles in current working directory" } )
set("n", "<leader>scb", builtin.current_buffer_fuzzy_find, { desc = "Fuzzy [s]earch in [c]urrent [b]uffer"              } )
set("n", "<leader>scs", builtin.colorscheme,               { desc = "[S]earch the [c]olor[s]chemes"                     } )

-- Neotree
set("n", "<leader>nt", ":Neotree toggle<cr>",              { desc = "[N]eotree [t]oggle"                                } )
set("n", "<leader>nb", ":Neotree buffers float<cr>",       { desc = "[N]eotree [b]uffers"                               } )
set("n", "<leader>nf", ":Neotree current<cr>",             { desc = "[N]eotree [f]ullscreen"                            } )

-- Window Movement
set("n", "<C-w><S-h>", ":WinShift left<cr>",               { desc = "Move window left"                                  } )
set("n", "<C-w><S-j>", ":WinShift down<cr>",               { desc = "Move window down"                                  } )
set("n", "<C-w><S-k>", ":WinShift up<cr>",                 { desc = "Move window up"                                    } )
set("n", "<C-w><S-l>", ":WinShift right<cr>",              { desc = "Move window right"                                 } )

--- Remind yourself to use hjkl
vim.keymap.set('n', '<Up>',    ':echoe "Use k!"<CR>', { silent = true })
vim.keymap.set('n', '<Down>',  ':echoe "Use j!"<CR>', { silent = true })
vim.keymap.set('n', '<Left>',  ':echoe "Use h!"<CR>', { silent = true })
vim.keymap.set('n', '<Right>', ':echoe "Use l!"<CR>', { silent = true })
