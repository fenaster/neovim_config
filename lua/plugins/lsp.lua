return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			setup = {
				yamlls = function(_, opts)
					-- Disable for Ansible files
					opts.filetypes = { "yaml" }
					return false
				end,
				ansiblels = function(_, opts)
					-- Let Ansible LSP handle all YAML (or limit to Ansible if needed)
					opts.filetypes = { "yaml", "ansible" }
					return false
				end,
			},
		},
	},
}
