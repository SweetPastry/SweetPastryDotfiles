return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		main = "nvim-treesitter.configs",
		opts = {
		ensure_installed = { "c", "lua", "vim", "vimdoc", "python", "java", "javascript", "html", "latex", "markdown", "bash", "rust" },
		sync_install = false,
		highlight = { enable = true },
		indent = { enable = true },
		},
	},
}