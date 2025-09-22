return {
    "xiyaowong/transparent.nvim",
    lazy = false, --this was SUPER IMPORTANT
    config = function()
        require("transparent").setup({ -- Optional, you don't have to run setup.
            groups = {           -- table: default groups
                "Normal",
                "NormalNC",
                "Comment",
                "Constant",
                "Special",
                "Identifier",
                "Statement",
                "PreProc",
                "Type",
                "Underlined",
                "Todo",
                "String",
                "Function",
                "Conditional",
                "Repeat",
                "Operator",
                "Structure",
                "LineNr",
                "NonText",
                "SignColumn",
                "CursorLine",
                "CursorLineNr",
                "StatusLine",
                "StatusLineNC",
                "EndOfBuffer",
            },
            extra_groups = {"NeoTreeNormal","NeoTreeNormalNC"}, -- and this was super important as well
            exclude_groups = {}, -- table: groups you don't want to clear
        })
    end,
}