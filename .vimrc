"-----------------------------------------------------------------------------
" Init
"-----------------------------------------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'Vundle/Vundle.vim'


"-----------------------------------------------------------------------------
" Minimal
"-----------------------------------------------------------------------------

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-commentary'
Plugin 'Yggdroot/indentLine'
Plugin 'vimwiki/vimwiki'
Plugin 'junegunn/goyo.vim'
Plugin 'airblade/vim-gitgutter'
source ~/.minvimrc


"-----------------------------------------------------------------------------
" Extended
"-----------------------------------------------------------------------------

Plugin 'preservim/nerdtree'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plugin 'junegunn/fzf.vim'
Plugin 'preservim/tagbar'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
source ~/.extvimrc

call vundle#end()
filetype plugin indent on
" To ignore plugin indent changes, instead use:
"filetype plugin on


"-----------------------------------------------------------------------------
" Sets
"-----------------------------------------------------------------------------

set timeout timeoutlen=500 ttimeoutlen=100
set smartindent
set hidden
set hlsearch
set ignorecase
set incsearch
set wildmenu
set showcmd
set showmode
set autoread
set list
set listchars=tab:‣\ ,trail:·,precedes:«,extends:»,eol:¬
set nu
set relativenumber
set ttyfast
set nowrap
set shiftwidth=4
set softtabstop=4
set expandtab
set colorcolumn=+1
set termwinsize=10x200
set textwidth=79
" Don't format to 79 textwidth by default
set formatoptions=

"-----------------------------------------------------------------------------
" Autocommands
"-----------------------------------------------------------------------------

" Set textwidth to specified files and format them automatically
au BufRead,BufNewFile *.md,*.wiki,*.py,*.txt setlocal textwidth=79
au BufRead,BufNewFile *.md,*.wiki,*.py,*.txt setlocal formatoptions+=t
" Highlight horizontal line in NORMAL mode
augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END
" Highlight characters if line length is over 79 and apply it to files
function! Length()
    augroup linelength
        au BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
        au BufEnter * match OverLength /\%80v.*/
    augroup END
endfunction
au BufRead,BufNewFile *.md,*.wiki,*.py,*.txt call Length()
" Make switch between modes a bit faster
" WARNING Note that this will make it impossible to use mappings that start
" with <Esc> while in insert mode
"if ! has('gui_running')
"    set ttimeoutlen=200
"    augroup FastEscape
"        autocmd!
"        au InsertEnter\* set timeoutlen=300
"        au InsertLeave * set timeoutlen=300
"    augroup END
"endif

"-----------------------------------------------------------------------------
" Color settings
"-----------------------------------------------------------------------------

syntax on
colorscheme gruvbox
set background=dark
set termguicolors
" Make tmux colors great again
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"


"-----------------------------------------------------------------------------
" Custom binds
"-----------------------------------------------------------------------------

set pastetoggle=<F4>
autocmd Filetype python nnoremap <buffer> <F10> :w<CR> :bo ter python3 "%"<CR>
nnoremap <leader>r :source $MYVIMRC<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>c :close<CR>
nnoremap <C-j> gT
nnoremap <C-k> gt
inoremap <C-j> <ESC>gT
inoremap <C-k> <ESC>gt
nnoremap <leader>] :nohl<CR>
nnoremap <leader>pi :PluginInstall<CR>
nnoremap <leader>ev :tabedit $HOME/.vimrc<CR>
nnoremap <leader>ee :tabedit $HOME/.extvimrc<CR>
nnoremap <leader>em :tabedit $HOME/.minvimrc<CR>
nnoremap <leader>et :tabedit $HOME/.tmux.conf<CR>
" Select again deselected
nnoremap <leader>v V`]
" Indent select with Shift-< and Shift->
nnoremap <lt>> V`]<
nnoremap ><lt> V`]>
nnoremap =- V`]=
nnoremap <leader>q :wa<CR> :qa<CR>
" Go full-vim mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"-----------------------------------------------------------------------------
" Backup settings
"-----------------------------------------------------------------------------

set undofile                      " enable undo's
set backup                        " enable backups
set noswapfile                    " it's 2013, Vim.
" Folder paths
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

