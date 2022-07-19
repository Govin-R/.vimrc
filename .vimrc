:echom ">^.^<"

set nocompatible
syntax enable
filetype plugin indent on
set autoindent

" for menubar,toolbar hide
set guioptions -=m
set guioptions -=T


call plug#begin()

" File and folder management
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'frazrepo/vim-rainbow'


" Language support
Plug 'tpope/vim-projectionist'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'maxmellon/vim-jsx-pretty'

" Dart flutter
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/dartlang-snippets'
Plug 'natebosch/vim-lsc'
Plug 'reisub0/hot-reload.vim'

" Git
Plug 'airblade/vim-gitgutter'

" Theme
Plug 'tomasiser/vim-code-dark'

" rust
Plug 'rust-lang/rust.vim',{'for':'rust'}
Plug 'dense-analysis/ale',{'for':'rust'}

call plug#end()

colorscheme codedark

set noerrorbells   
set cursorline                  
set number
set nowrap
set nohlsearch
set smartcase
set noswapfile
set nobackup
set undodir=~/AppData/Local/nvim-data/backup
set undofile
set incsearch
set tabstop=2
" set softtabstop=0 noexpandtab
set shiftwidth=2
set clipboard=unnamedplus
set backspace=indent,eol,start


let mapleader=" "
nnoremap <leader>fe :CocCommand flutter.emulators <CR>
nnoremap <leader>fd :below new output:///flutter-dev <CR>
map <leader>h :wincmd h <CR>
map <leader>j :wincmd j <CR>
map <leader>k :wincmd k <CR>
map <leader>l :wincmd l <CR>

nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>
map <F6> :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>
map <C-o> :NERDTreeToggle %<CR>

" for python exec
autocmd FileType python map <F5> :w <CR> :!python % <CR>
" for bash exec
autocmd FileType sh map <F5> :w <CR> :!bash % <CR>
" for rust exec
autocmd FileType rust map <F5> :w <CR>:!rustc % && runable=$(basename -s .rs %) && ./$runable <CR>

" for cut,copy,paste
vmap <C-c> "+y
vmap <C-x> "+x
vmap <C-v> "+gP


let g:dart_format_on_save = 1

" Coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nmap <C-P> :FZF<CR>

nmap <leader>gs :G<CR>
nmap <leader>gh :diffget //2<CR>
nmap <leader>gl :diffget //3<CR>

" imap <tab> <Plug>(coc-snippets-expand)
let g:UltiSnipsExpandTrigger = '<Nop>'
" let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

"coc config
let g:coc_global_extensions = [
  \ 'coc-flutter',
  \ 'coc-snippets',
  \ 'coc-yaml'
  \ ]

let g:NERDTreeGitStatusWithFlags = 1
let g:lsc_auto_map = v:true
let g:dart_format_on_save = 1
let dart_html_in_string=v:true
let g:dart_style_guide = 2


" fun python file

