return { 
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "Issafalcon/neotest-dotnet"
    },
    config = function()
        local neotest = require("neotest")
        neotest.setup({
            require("neotest-dotnet")
        })

        vim.keymap.set("n", "<leader>tn", neotest.run.run(), {})
        vim.keymap.set("n", "<leader>tf", neotest.run.run(vim.fn.expand("%")), {})
    end
}
