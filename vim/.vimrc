"  启用语法高亮
syntax enable

"  语法高亮颜色选择, morning, elflord, industry, torte, ron, desert
" colorscheme ron

" 设置语法补全
call plug#begin('~/.vim/plugged')

" 代码补全插件（选一个或多个）
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " Coc.nvim, 类似VSCode, 基于Node.js, 支持LSP
" Plug 'ycm-core/YouCompleteMe'  " YouCompleteMe(性能较重), 老牌, 基于C++, 配置复杂
" Plug 'Shougo/deoplete.nvim'  " deoplete.nvim, 轻量, 基于Python
" Plug 'hrsh7th/nvim-cmp'  " nvim-cmp(适用于 Neovim)

call plug#end()
" set cursorline
set completeopt=menu,menuone,noselect
" set number
highlight Pmenu guibg=gray guifg=black
highlight PmenuSel guibg=blue guifg=white
highlight PmenuSbar guibg=lightgray
highlight PmenuThumb guibg=darkgray

" 代码补全快捷键映射
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
inoremap <expr> <Enter> pumvisible() ? "\<C-y>" : "\<Enter>"

" tab 键为四个空格
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
