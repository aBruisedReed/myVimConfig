" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasiser/vim-code-dark'
Plugin 'matchparenpp'
" Plugin 'townk/vim-autoclose' error occur with ycm
Plugin 'Raimondi/delimitMate'
Plugin 'The-NERD-tree'
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'vim-airline/vim-airline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'blueyed/vim-diminactive'
Plugin 'tpope/vim-fugitive'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'dahu/vim-fanfingtastic'
Plugin 'preservim/nerdcommenter'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'scrooloose/syntastic'
"Gitgutter 수동설치함

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Syntax Highlighting
if has("syntax")
    syntax on
endif

" vim code dark
colorscheme codedark
set background=dark 

" spaces, tabs, indent
set smartindent
set tabstop=2
set expandtab
set softtabstop=2
set autoindent
set shiftwidth=2

" line number
set nu
set relativenumber 

" cursor highlight
set cursorline

" searching ignoring case
set ignorecase

" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

" NERDTree ON 단축키를 "\nt"로 설정
map <Leader>nt <ESC>:NERDTreeToggle<CR>
" NT로 파일 열고 NT 자동 닫기
let NERDTreeQuitOnOpen=1
" 숨김 파일 표시
let NERDTreeShowHidden=1

" 상태바 표시를 항상한다
set laststatus=2 
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\

" for vim-airline
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
set laststatus=1 " turn on bottom bar

" for emmet.vim, tutorial https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL
" let g:user_emmet_leader_key=','

" like zsh, Ex command autocomplete
set wildmenu 
set wildmode=full

" search option
set hlsearch
set incsearch
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = 'V' . substitute(escape(@s, a:cmdtype.''), '\n', '\\n', 'g')
  let @s = temp
endfunction

" cmd line mode history
set history=200

" indent guide 
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey
let g:indent_guides_guide_size=1

" buffer key mapping
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

"insert newline without entering insertmode
nmap <CR> i<CR><Esc>

" ycm, not pop up preview
set completeopt-=preview

" apply vim-jsx to .js file
let g:jsx_ext_required = 0

" turn off hls result
nnoremap <Esc><Esc> :silent! nohls<CR>

" for matchit plugin
set nocompatible
filetype plugin on
runtime macros/matchit.vim

" substitute
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" fanfingtastic
let g:fanfingtastic_ignorecase = 1

" nerd commenter" Create default mappings
let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" gutentags
set statusline+=%{gutentags#statusline()}

" syntasitc
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
