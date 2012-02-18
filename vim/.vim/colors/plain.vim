" Vim color file
" Maintainer:   Your name <youremail@something.com>
" Last Change:
" URL:

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

" your pick:
set background=dark	" or light
hi clear
if exists("syntax_on")
    syntax reset
endif
" let g:colors_name="mycolorscheme"

"hi Normal

" OR

" highlight clear Normal
" set background&
" highlight clear
" if &background == "light"
"   highlight Error ...
"   ...
" else
"   highlight Error ...
"   ...
" endif

" A good way to see what your colorscheme does is to follow this procedure:
" :w
" :so %
"
" Then to see what the current setting is use the highlight command.
" For example,
" 	:hi Cursor
" gives
"	Cursor         xxx guifg=bg guibg=fg

" Uncomment and complete the commands you want to change from the default.

"hi Cursor
"hi CursorIM
"hi Directory
"hi DiffAdd
"hi DiffChange
"hi DiffDelete
"hi DiffText
"hi ErrorMsg
"hi VertSplit
"hi Folded
"hi FoldColumn
"hi IncSearch
hi LineNr ctermbg=DarkGray ctermfg=Green
"hi ModeMsg
"hi MoreMsg
"hi NonText
"hi Question
"hi Search
"hi SpecialKey
"hi StatusLine
"hi StatusLineNC
"hi Title
"hi Visual
"hi VisualNOS
"hi WarningMsg
" hi WildMenu ctermfg=DarkYellow
" hi Menu ctermfg=DarkYellow
"hi Scrollbar
" hi Tooltip ctermfg=DarkYellow

" syntax highlighting groups
hi Comment ctermfg=DarkGray
hi Constant ctermfg=LightRed
hi Identifier ctermfg=DarkYellow
hi Statement ctermfg=Green
hi PreProc ctermfg=Green
hi Type ctermfg=DarkRed
hi Special ctermfg=DarkRed
"hi Underlined
" hi Ignore
"hi Error
"hi Todo

