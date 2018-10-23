" Vundle {{{
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set runtimepath+=~/.fzf
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Custom plugins here
Plugin 'altercation/vim-colors-solarized'
Plugin 'sjl/gundo.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'ambv/black'
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'Valloric/YouCompleteMe'
Plugin 'leafgarland/typescript-vim'
Plugin 'tmux-plugins/vim-tmux-focus-events'

call vundle#end()
filetype plugin indent on
" }}}
" Custom Functions {{{
" strips trailing whitespace at the end of lines
function! StripTrailingWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

" activate virtualenv if applicable
function! ActivateVirtualEnv()
    if has("python3")
        python3 << EOF
import os
if 'VIRTUAL_ENV' in os.environ:
    virtual_env_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(virtual_env_dir, 'bin/activate_this.py')

    with open(activate_this, 'rb') as f:
        exec(f.read(), {'__file__': activate_this})
EOF
    endif
endfunction
" }}}
" Colors {{{
syntax enable              " enable syntax highlighting
colorscheme solarized
set background=dark
" }}}
" Misc {{{
set encoding=utf-8
set fileformat=unix        " default to unix line endings
set modelines=1            " look for a modeline in the last line of the file
set autoread               " reload files changed outside of vim

" jk is escape
inoremap jk <esc>
command! Wq wq             " just save and quit already
" }}}
" Spaces & Tabs {{{
set tabstop=4              " number of visual spaces per tab
set softtabstop=4          " number of spaces in tab when editing
set expandtab              " tabs are spaces

" highlight trailing spaces
highlight TrailingSpaces ctermbg=red guibg=red
match TrailingSpaces /\s\+$/
" }}}
" UI Config {{{
set relativenumber         " show line numbers
set showcmd                " show command in bottom bar
set cursorline             " highlight current line
filetype indent on         " load filetype-specific indent files
set wildmenu               " visual autocomplete for command menu
"set lazyredraw             " redraw only when we need to
set showmatch              " highlight matching [{()}]
"set ttyfast                " improves performace for fast connections
set showmode               " display current mode
set shortmess=a            " abbreviate file messages
" }}}
" Status Line {{{
set laststatus=2            " display statusline

function! StatuslineGitBranch() abort
    let l:branch_name = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
    return strlen(l:branch_name) > 0 ? l:branch_name : ''
endfunction

set statusline=
set statusline+=%<\                              " cut at start
if strlen(StatuslineGitBranch())
    set statusline+=%#PmenuSel#
    set statusline+=\ %{StatuslineGitBranch()}\  " current git branch name
endif
set statusline+=%#LineNr#
set statusline+=\ [%n]                           " current file buffer number
set statusline+=\ %-40f                          " current file path
set statusline+=%=                               " push to right-hand side
set statusline+=%#PmenuSel#
set statusline+=\ %M%R                           " notable flags for current file
set statusline+=%10(%l:%c%)\                     " line and column numbers
" }}}
" Searching {{{
set incsearch              " match as characters are entered
set hlsearch               " highlight search matches

" turn off search highlight
nnoremap <leader>/ :nohlsearch<CR>

if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor
endif
" }}}
" Folding {{{
set foldenable             " enable folding
set foldlevelstart=10      " open most folds by default
set foldnestmax=10         " 10 nested fold max
set foldmethod=indent      " fold based on indent level

" space opens/closes folds
nnoremap <space> za
" }}}
" Movement {{{
" use 'jk' for escape
inoremap jk <Esc>

" move vertically by visual line
"nnoremap j gj
"nnoremap k gk
"noremap  <buffer> <silent> k gk
"noremap  <buffer> <silent> j gj
"noremap  <buffer> <silent> 0 g0
"noremap  <buffer> <silent> $ g$

" navigate splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" highlight last inserted text
nnoremap gV `[v`]

" set mark before search
nnoremap / ml/
nnoremap ? ml?

" set mark before jumping to top
nnoremap gg mkgg
nnoremap G mkG

" quick horizontal/vertical splits
nnoremap _ :sp<cr>
nnoremap <bar> :vsp<cr>

" left/right arrows navigate buffers
nnoremap <left> :bp<cr>
nnoremap <right> :bn<cr>

" up/down arrows navigate jump list
nnoremap <up> <c-o>
nnoremap <down> <c-i>
" }}}
" Leader Shortcuts {{{
let mapleader=","          " leader is comma

" edit vimrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" save session
nnoremap <leader>s :mksession<CR>

" quick switch buffer list
set wildcharm=<C-Z>
nnoremap <leader>b :b <C-Z>

" auto format current file
nnoremap <silent> <leader>f :doautocmd <nomodeline> autoformatgroup BufWritePre,BufWritePost<CR>
" }}}
" Backups {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}
" Autogroups {{{
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufNewFile,BufRead *.md,*.txt setlocal spell
    autocmd BufNewFile,BufRead *.ract set filetype=mustache
    autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=88 expandtab autoindent smartindent formatoptions=croql colorcolumn=72,88
    autocmd FileType html,htmldjango setlocal tabstop=2 softtabstop=2 shiftwidth=2 textwidth=0
    autocmd FileType sass,scss,css setlocal tabstop=2 softtabstop=2 shiftwidth=2 textwidth=120
    autocmd Filetype mustache setlocal tabstop=4 shiftwidth=4 expandtab
    autocmd Filetype mkd,mkd.markdown setlocal tabstop=2 shiftwidth=2 textwidth=80 expandtab
    autocmd Filetype typescript,javascript,json setlocal tabstop=2 shiftwidth=2 expandtab
augroup END

augroup autoformatgroup
    autocmd!
    autocmd BufWritePre * :call StripTrailingWhitespace()
    " autocmd BufWritePost *.py execute ':silent Black'
augroup END

augroup autoreadgroup
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
    autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
augroup END
" }}}
" Virtualenv {{{
call ActivateVirtualEnv()
" }}}
" fzf {{{
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

nmap ; :Buffers<CR>
nmap <leader>p :Files<CR>
" }}}
" Ack {{{
if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" TODO set global mark prior to search
nnoremap <leader>a :Ack<Space>

" TODO set global mark prior to search
nnoremap <C-a> :Ack "<cword>"<CR>

" Close QuickFix window
nnoremap <Bslash>x :cclose<CR>
" }}}
" NERDTree {{{
map <C-\> :NERDTreeToggle<CR>
" }}}
" Gundo {{{
" default Ubuntu has +python3 and not +python
let g:gundo_prefer_python3 = 1

" toggle undo pane
nnoremap <leader>u :GundoToggle<CR>
" }}}
" Moustache/Handlebars {{{
let g:mustache_abbreviations = 1
" }}}

" vim:foldmethod=marker:foldlevel=0
