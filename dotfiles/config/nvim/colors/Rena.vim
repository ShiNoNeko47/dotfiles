" Vim color file

set background=dark
set termguicolors
" set t_Co=256
let g:colors_name="Rena"

let python_highlight_all = 1
" let c_gnu = 1


hi Normal       guifg=#ffffff   guibg=None gui=None
hi Conceal      guifg=#ffffff   guibg=None gui=None
hi Cursor       guifg=#dadada  guibg=#5f00ff   gui=None
hi SignColumn                guibg=None
hi SpecialKey   guifg=#ff00ff   guibg=None gui=None
hi Directory    guifg=#ffffff   guibg=None gui=Bold
hi CursorLine   guifg=None guibg=None gui=None
hi ErrorMsg     guifg=#ffffff   guibg=#ff0000  gui=None
hi PreProc      guifg=#767676  guibg=None gui=Bold
hi Search       guifg=None    guibg=None  gui=BoldUnderline
hi Type         guifg=#d75f00  guibg=None gui=None
hi Statement    guifg=#ff5f00  guibg=None gui=Bold
hi Comment      guifg=#8a8a8a  guibg=None gui=None
hi LineNr       guifg=#d75fff  guibg=None gui=None
hi CursorLineNr guifg=#d75fff  guibg=None gui=Bold
hi NonText      guifg=#8787ff  guibg=None gui=Bold
hi DiffText     guifg=#d700ff  guibg=#808080  gui=None
hi Constant     guifg=#d75fff  guibg=None gui=None
hi Todo         guifg=#d70087  guibg=None gui=Bold
hi Identifier   guifg=#ffffff   guibg=None gui=Bold
hi Error        guifg=None guibg=#ff0000  gui=Bold
hi Special      guifg=#808080  guibg=None gui=Bold
hi Ignore       guifg=#ffd75f  guibg=None gui=Bold
hi Underline    guifg=#afafff  guibg=None gui=Italic
hi WildMenu     guifg=#d7af00  guibg=#767676  gui=None
hi FoldColumn   guifg=#af5f87  guibg=None gui=None
hi Folded       guifg=#af5f87  guibg=None gui=Bold

hi Visual       guifg=#000000    guibg=#d75fff  gui=None

hi Pmenu        guifg=#ffffff   guibg=#121212  gui=None
hi PmenuSel     guifg=#ffffff   guibg=#080808  gui=Bold
hi PmenuSbar    guifg=#9e9e9e  guibg=#121212  gui=Bold
hi PmenuThumb   guifg=#a8a8a8  guibg=#121212  gui=None

hi StatusLineNC guifg=#bcbcbc  guibg=#3a3a3a  gui=None
hi StatusLine   guifg=#d75f00  guibg=#3a3a3a  gui=Bold
hi VertSplit    guifg=#d75f00  guibg=None gui=None

hi TabLine      guifg=#ffffff   guibg=#4e4e4e  gui=None
hi TabLineFill  guifg=#4e4e4e  guibg=#4e4e4e
hi TabLineSel   guifg=#ffffff   guibg=#303030  gui=Bold

hi SpellCap                  guibg=#d70087
hi SpellLocal                guibg=#d75f00
hi SpellBad                  guibg=#800000
hi MatchParen                guibg=#d75f00
hi EndOfBuffer  guifg=#000000
hi Question		guifg=#ffffff 	gui=Bold

hi NotifyBackground guibg=#000000
"vim:;sw=4
