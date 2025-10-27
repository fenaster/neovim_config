return {
	{
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			local cmp = require("cmp")
			local context = require("cmp.config.context")

			opts.enabled = function()
				-- Disable in comments
				if context.in_treesitter_capture("comment") == true or context.in_syntax_group("Comment") then
					return false
				end
				return true
			end

			-- Override mappings
			opts.mapping = vim.tbl_extend("force", opts.mapping, {
				["<Tab>"] = cmp.mapping.confirm({ select = true }),
				["<CR>"] = function(fallback)
					fallback() -- make Enter do whatever it normally does
				end,
			})

			return opts
		end,
	},
}
