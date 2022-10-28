" Vim color file

set background=light
set t_Co=256
let g:colors_name="Rena"

let python_highlight_all = 1
let c_gnu = 1


hi Normal       ctermfg=15   ctermbg=None cterm=None
hi Conceal      ctermfg=15   ctermbg=None cterm=None
hi Cursor       ctermfg=253  ctermbg=57   cterm=None
hi SignColumn                ctermbg=None
hi SpecialKey   ctermfg=17   ctermbg=None cterm=None
hi Directory    ctermfg=15   ctermbg=None cterm=Bold
hi CursorLine   ctermfg=None ctermbg=None cterm=None
hi ErrorMsg     ctermfg=15   ctermbg=196  cterm=None
hi PreProc      ctermfg=243  ctermbg=None cterm=Bold
hi Search       ctermfg=0    ctermbg=171  cterm=Bold
hi Type         ctermfg=166  ctermbg=None cterm=None
hi Statement    ctermfg=202  ctermbg=None cterm=Bold
hi Comment      ctermfg=245  ctermbg=None cterm=None
hi LineNr       ctermfg=171  ctermbg=None cterm=None
hi CursorLineNr ctermfg=171  ctermbg=None cterm=Bold
hi NonText      ctermfg=105  ctermbg=None cterm=Bold
hi DiffText     ctermfg=165  ctermbg=244  cterm=None
hi Constant     ctermfg=171  ctermbg=None cterm=None
hi Todo         ctermfg=162  ctermbg=None cterm=Bold
hi Identifier   ctermfg=15   ctermbg=None cterm=Bold
hi Error        ctermfg=None ctermbg=196  cterm=Bold
hi Special      ctermfg=172  ctermbg=None cterm=Bold
hi Ignore       ctermfg=221  ctermbg=None cterm=Bold
hi Underline    ctermfg=147  ctermbg=None cterm=Italic
hi WildMenu     ctermfg=178  ctermbg=243  cterm=None
hi FoldColumn   ctermfg=132  ctermbg=None cterm=None
hi Folded       ctermfg=132  ctermbg=None cterm=Bold

hi Visual       ctermfg=0    ctermbg=171  cterm=None

hi Pmenu        ctermfg=15   ctermbg=233  cterm=None
hi PmenuSel     ctermfg=15   ctermbg=232  cterm=Bold
hi PmenuSbar    ctermfg=247  ctermbg=233  cterm=Bold
hi PmenuThumb   ctermfg=248  ctermbg=233  cterm=None

hi StatusLineNC ctermfg=250  ctermbg=237  cterm=None
hi StatusLine   ctermfg=166  ctermbg=237  cterm=Bold
hi VertSplit    ctermfg=166  ctermbg=None cterm=None

hi TabLine      ctermfg=15   ctermbg=239  cterm=None
hi TabLineFill  ctermfg=239  ctermbg=239
hi TabLineSel   ctermfg=15   ctermbg=236  cterm=Bold

hi SpellCap                  ctermbg=162
hi SpellLocal                ctermbg=166
hi SpellBad                  ctermbg=1
hi MatchParen                ctermbg=166
hi EndOfBuffer  ctermfg=0
"vim:;sw=4
