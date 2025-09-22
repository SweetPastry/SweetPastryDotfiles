-- return {
--     {
--     "LazyVim/LazyVim",
--     opts = {
--         colorscheme = "default",
--     },
--     },
-- }

return { -- https://github.com/navarasu/onedark.nvim
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority=1000,
		opts = {
			style = "darker", -- dark, darker, cool, deep, warm, warmer, light
			transparent = true,
			term_colors = true,
			ending_tildes = false,
			cmp_itemkind_reverse = false,
			toggle_style_key = nil,
			code_style = {
				comments = "italic",
				keywords = "bold",
				functions = "bold",
				strings = "bold",
				variables = "bold",
			},
			lualine = {
				transparent = true,
			},
			highlights = {
				Normal = { guibg = "NONE", bg = "NONE", ctermbg = "NONE" },
				NormalNC = { guibg = "NONE", bg = "NONE", ctermbg = "NONE" },
				NormalFloat = { guibg = "NONE", bg = "NONE", ctermbg = "NONE" },
				FloatBorder = { guibg = "NONE", bg = "NONE", ctermbg = "NONE" },
				SignColumn = { guibg = "NONE", bg = "NONE", ctermbg = "NONE" },
				StatusLine = { guibg = "NONE", bg = "NONE", ctermbg = "NONE" },
				StatusLineNC = { guibg = "NONE", bg = "NONE", ctermbg = "NONE" },
				EndOfBuffer = { guibg = "NONE", bg = "NONE", ctermbg = "NONE" },
			},
		},
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "onedark",
		},
	},
}
