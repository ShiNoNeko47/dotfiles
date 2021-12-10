set nocp
set ruler
set showcmd
set encoding=utf-8
set number
syntax on
colorscheme Rena
set tabstop=4
set autoindent
set softtabstop=4
set shiftwidth=4
set incsearch
set expandtab
set splitbelow splitright
set backspace=indent,eol,start
set mouse=a
set shortmess=at

call plug#begin()
Plug 'Valloric/YouCompleteMe'
Plug 'junegunn/vim-slash'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'OmniSharp/omnisharp-vim'
Plug 'tpope/vim-surround'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'zivyangll/git-blame.vim'
Plug 'stevearc/vim-arduino'
call plug#end()

" autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

vnoremap <C-c> "+y
nnoremap <C-c> "+yy

vnoremap <C-v> <C-v>
nnoremap <C-v> "+P

let g:livepreview_previewer = 'zathura'
set ut=1000

let g:mapleader=' '
nnoremap <Leader>b :<C-u>call gitblame#echo()<CR>
nnoremap <leader>p :LLPStartPreview<CR>
let g:pymode_rope_complete_on_dot = 0

let g:UltiSnipsExpandTrigger="<leader>s"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

nnoremap <leader>am <cmd>ArduinoVerify<CR>
nnoremap <leader>au <cmd>ArduinoUpload<CR>
nnoremap <leader>ad <cmd>ArduinoUploadAndSerial<CR>
nnoremap <leader>ab <cmd>ArduinoChooseBoard<CR>
nnoremap <leader>ap <cmd>ArduinoChooseProgrammer<CR> 

nnoremap <leader>t <cmd>terminal<CR>
tnoremap <Esc> <C-\><C-n>
autocmd TermOpen * startinsert
