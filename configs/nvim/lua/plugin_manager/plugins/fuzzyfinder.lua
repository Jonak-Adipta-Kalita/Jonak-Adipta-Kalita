return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",

	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		require("telescope").setup({})

		local builtin = require("telescope.builtin")
		local globalKey = "<C-F>"

		vim.keymap.set("n", globalKey .. "f", builtin.find_files, {})
		vim.keymap.set("n", globalKey .. "g", builtin.git_files, {})
		vim.keymap.set("n", globalKey .. "pws", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set("n", globalKey .. "pWs", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set("n", globalKey .. "ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
		vim.keymap.set("n", globalKey .. "vh", builtin.help_tags, {})
	end
}
