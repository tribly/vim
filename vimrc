"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

let s:dein_base = '/home/heinz/.vim/bundle'
let s:dein_repo_path = s:dein_base . '/repos/github.com/Shougo/dein.vim'
let s:dein_repo_url = 'https://github.com/Shougo/dein.vim'
let &runtimepath.=','.s:dein_repo_path

" dein.vim
let g:dein#types#git#clone_depth = 1
try
	if dein#load_state(s:dein_base)
		call dein#begin(s:dein_base)
		call dein#end()
		call dein#save_state()
	endif
catch /E117:/ " dein not installed
	execute "silent !git clone" s:dein_repo_url s:dein_repo_path
	call dein#begin(s:dein_base)
	set nomore
	call dein#install()
	call dein#end()
	quit
endtry

" Required:
if dein#load_state('/home/heinz/.vim/bundle')
  call dein#begin('/home/heinz/.vim/bundle')

  " Let dein manage dein
  " Required:
  call dein#add('/home/heinz/.vim/bundle/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('SirVer/ultisnips')
  call dein#add('Valloric/vim-operator-highlight')
  call dein#add('junegunn/goyo.vim')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('vim-syntastic/syntastic')
  call dein#add('godlygeek/tabular')
  call dein#add('mbbill/undotree')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable
"End dein Scripts-------------------------

let g:molokai_original = 1
let g:rehash256 = 1

let g:airline_theme='raven'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let mapleader = ","

" lets ultisnip use tab as the seletor
" instead of the default c-j/k
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:ultisnips_python_style="doxygen"

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
" Turn backup off
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
" Use spaces instead of tabs
set expandtab

" Linebreak on 500 characters
set lbr
"set tw=80

set ai "Auto indent
set si "Smart indent
set nowrap "Don't wrap lines

colorscheme molokai

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
nnoremap gQ <nop>
nnoremap K <nop>

:map <F2> :set number! relativenumber!<CR>
:map <F3> :set paste!<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F6> :GitGutterToggle<CR>

" pasting to fb
nmap <F12> :!fb %<CR>
com -range=% Fb :exec "<line1>,<line2>w !fb -n " . expand("%:t")

au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,*.md  setf markdown

" Go to the first empty line on new mails
autocmd BufRead ~/.mutt/temp/* execute "normal /^$/\n"
