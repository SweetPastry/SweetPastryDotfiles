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
		lazy = true,
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
				Normal   = { bg = "NONE", ctermbg = "NONE" },
				NormalNC = { bg = "NONE", ctermbg = "NONE" },
				NormalFloat  = { bg = "NONE" },
				FloatBorder  = { bg = "NONE" },
				SignColumn   = { bg = "NONE" },
				StatusLine   = { bg = "NONE" },
				StatusLineNC = { bg = "NONE" },
				EndOfBuffer  = { bg = "NONE" },
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
