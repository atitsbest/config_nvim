return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    setup = function() 
        require("telescope").setup {
            extensions = {
                file_browser = {
                    theme = "ivy",
                    -- disables netrw and use telescope-file-browser in its place
                    hijack_netrw = true,
                },
            },
        }
    end,
    config = function()
        -- file browser
        vim.api.nvim_set_keymap(
            "n",
            "<space>px",
            ":Telescope file_browser<CR>",
            { noremap = true }
        )
    end
}
