return {
	'nvim-telescope/telescope.nvim', tag = '0.1.4',
	-- or                              , branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function() 
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
		vim.keymap.set('n', '<leader><leader>', builtin.git_files, {})
		vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
	end
}
