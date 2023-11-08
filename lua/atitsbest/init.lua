vim.g.mapleader = " "  
require("lazy").setup("atitsbest.plugins")

-- color scheme
vim.cmd.colorscheme "catppuccin"
--
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"

require("atitsbest.remap")
require("atitsbest.set")
