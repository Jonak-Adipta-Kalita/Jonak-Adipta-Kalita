return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"python", "javascript", "typescript", "c", "go", "rust", "lua", "jsdoc", "vimdoc", "svelte"
				},
				sync_install = false,
				auto_install = true,
				indent = {
					enable = true
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = { "markdown" },
				},
			})
		end
	},
	{
		"neovim/nvim-lspconfig",

		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			"j-hui/fidget.nvim",
		},

		config = function()
			local cmp = require("cmp")
			local cmp_lsp = require("cmp_nvim_lsp")
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				cmp_lsp.default_capabilities()
			)

			require("fidget").setup({})

			require("mason").setup({
				ui = {
					border = "rounded"
				},
				ensure_installed = {
					"stylua",
					"autopep8"
				}
			})

			require("mason-lspconfig").setup({
				ensure_installed = {
					"pylsp",
					"ts_ls",
					"lua_ls",
					"clangd",
					"gopls",
					"rust_analyzer",
					"tailwindcss",
					"svelte",
				},
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup {
							capabilities = capabilities
						}
					end,
				},
			})

			require("lspconfig").lua_ls.setup {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }
						}
					}
				}
			}

			local cmp_select = { behavior = cmp.SelectBehavior.Select }
			cmp.setup({
				mapping = cmp.mapping.preset.insert({
					['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
					['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
					['<TAB>'] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
				}, {
					{ name = 'buffer' },
				})
			})

			vim.diagnostic.config({
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})

			vim.cmd([[
			  augroup format_on_save
				autocmd!
				autocmd BufWritePre *.py,*.lua :lua vim.lsp.buf.format()
			  augroup END
			]])
		end
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			local npairs = require("nvim-autopairs")
			local Rule = require("nvim-autopairs.rule")

			npairs.setup({
				check_ts = true,
				ts_config = {
					lua = { "string", "source" },
					javascript = { "template_string" },
				},
				fast_wrap = {
					map = "<M-e>",
					chars = { "{", "[", "(", '"', "'", "<" },
					pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
					offset = 0,
					end_key = "$",
					keys = "qwertyuiopzxcvbnmasdfghjkl",
					check_comma = true,
					highlight = "Search",
					highlight_grey = "Comment",
				},
				map_cr = true
			})

			npairs.add_rules({
				Rule("<", ">", { "html", "typescriptreact", "javascriptreact" })
					:with_pair(function(opts)
						local prev_char = opts.line:sub(opts.col - 1, opts.col - 1)
						return prev_char ~= "/"
					end)
					:with_move(function(opts)
						return opts.char == ">"
					end)
					:with_del(function(opts)
						local next_char = opts.line:sub(opts.col, opts.col)
						return next_char == ">"
					end)
					:use_key(">"),
			})

			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end
	}
}
