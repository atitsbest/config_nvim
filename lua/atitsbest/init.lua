vim.g.mapleader = " "  
require("lazy").setup("atitsbest.plugins")

-- color scheme
vim.cmd.colorscheme "catppuccin"

require("atitsbest.remap")
require("atitsbest.set")
