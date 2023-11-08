return {
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		lazy = true,
		config = false,
		init = function()
			-- Disable automatic setup, we are doing it manually
			vim.g.lsp_zero_extend_cmp = 0
			vim.g.lsp_zero_extend_lspconfig = 0

			local lsp = require("lsp-zero")
			lsp.preset("recommended")



		end,
		dependencies = {
			{
				'williamboman/mason.nvim',
				lazy = false,
				config = function() 
					require("mason").setup()
					require("mason-lspconfig").setup {
						ensure_installed = { "lua_ls", "omnisharp", "tsserver" },
					}
				end
			},

			-- Autocompletion
			{
				'hrsh7th/nvim-cmp',
				event = 'InsertEnter',
				dependencies = {
					{'L3MON4D3/LuaSnip'},
				},
				config = function()
					-- Here is where you configure the autocompletion settings.
				local lsp_zero = require('lsp-zero')
					lsp_zero.extend_cmp()

					-- And you can configure cmp even more, if you want to.
					local cmp = require('cmp')
					local cmp_action = lsp_zero.cmp_action()

					cmp.setup({
                        -- Github Copilot integration
                        sources = {
                            { name = "copilot" },
                            { name = "nvim_lsp" }
                        },
                        preselect = "item",
                        completion = {
                            completeopt = "menu,menuone,noinsert"
                        },
                        window = {
                            completion = cmp.config.window.bordered()
                        },
						formatting = lsp_zero.cmp_format(),
						mapping = cmp.mapping.preset.insert({
                            -- Tab to confirm completion
                            ['<Tab>'] = cmp.mapping.confirm({
                                -- documentation says this is important.
                                -- I don't know why.
                                behavior = cmp.ConfirmBehavior.Replace,
                                select = false,
                            }),

                            -- Ctrl+Space to triger completion menu
							['<C-Space>'] = cmp.mapping.complete(),

							['<C-u>'] = cmp.mapping.scroll_docs(-4),
							['<C-d>'] = cmp.mapping.scroll_docs(4),
							['<C-f>'] = cmp_action.luasnip_jump_forward(),
							['<C-b>'] = cmp_action.luasnip_jump_backward(),
						})
					})
				end
			},

			-- LSP
			{
				'neovim/nvim-lspconfig',
				cmd = {'LspInfo', 'LspInstall', 'LspStart'},
				event = {'BufReadPre', 'BufNewFile'},
				dependencies = {
					{'hrsh7th/cmp-nvim-lsp'},
					{'williamboman/mason-lspconfig.nvim'},
				},
				config = function()
					-- This is where all the LSP shenanigans will live
				local lsp_zero = require('lsp-zero')
					lsp_zero.extend_lspconfig()

					lsp_zero.on_attach(function(client, bufnr)
						-- see :help lsp-zero-keybindings
						-- to learn the available actions
						lsp_zero.default_keymaps({buffer = bufnr})

						vim.keymap.set("n", "<F12>", function() vim.lsp.buf.definion() end, opts)
						vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
						vim.keymap.set("n", "<Alt-leader>", function() vim.lsp.buf.code_action() end, opts)
						vim.keymap.set("n", "<C-rr>", function() vim.lsp.buf.rename() end, opts)
					end)

					require('mason-lspconfig').setup({
						ensure_installed = {},
						handlers = {
							lsp_zero.default_setup,
							lua_ls = function()
								-- (Optional) Configure lua language server for neovim
								local lua_opts = lsp_zero.nvim_lua_ls()
								require('lspconfig').lua_ls.setup(lua_opts)
							end,
						}
					})
				end
			}
		}
	},
}
