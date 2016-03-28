execute pathogen#infect()

let g:molokai_original = 1
let g:rehash256 = 1

"let g:airline_powerline_fonts = 1
"let g:airline_theme = "dark"

let g:powerline_pycmd = "py3"

let mapleader = ","

"let g:clang_snippets = 1
"let g:clang_snippets_engine = 'ultisnips'
"set completeopt=menu,menuone

" lets ultisnip use tab as the seletor
" instead of the default c-j/k
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:ultisnips_python_style="doxygen"

let NERDTreeIgnore = ['\.class$']

syntax on

filetype plugin on
filetype indent on

"for latexsuite
"set grepprg=grep\ -nH\ $*
"let g:tex_flavor = "latex"
"set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after


"set rtp+=/usr/lib/python3.5/site-packages/powerline/bindings/vim
set number
set t_Co=256
set cul
set softtabstop=4
set autoindent
set autoread
set cpoptions+=$
set noshowmode
set laststatus=2
set encoding=utf-8
set wildignore=*.class

" Offset to bottom/top when scrolling
set scrolloff=2

" Make the line numbers relative to the cursor position for easier navigation
set relativenumber

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Don't redraw while executing macros (good performance config)
set lazyredraw

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
"set tw=80

set ai "Auto indent
set si "Smart indent
set nowrap "Don't wrap lines

colorscheme molokai

" Show me I've written more than 80 chars in a line
"highlight OverLength ctermbg=darkred ctermfg=white guibg=#ffffff
"match OverLength /\%81v.\+/

if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

:nnoremap <leader>f zfa}
:nnoremap <leader>a :Tabularize /=
nnoremap Q <nop>
nnoremap K <nop>

:map <F2> :set number! relativenumber!<CR>
:map <F3> :set paste!<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F5> :NERDTreeToggle<CR>
nmap <F6> :GitGutterToggle<CR>

" pasting to fb
nmap <F12> :!fb %<CR>
com -range=% Fb :exec "<line1>,<line2>w !fb -n " . expand("%:t")

au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,*.md  setf markdown

" Go to the first empty line on new mails
autocmd BufRead ~/.mutt/temp/* execute "normal /^$/\n"
