return {
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
