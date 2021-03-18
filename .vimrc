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
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Yggdroot/indentLine'
Plugin 'vimwiki/vimwiki'
Plugin 'mattn/calendar-vim'
Plugin 'junegunn/goyo.vim'
Plugin 'airblade/vim-gitgutter'
"Plugin 'tpope/vim-fugitive'
source ~/.minvimrc


"-----------------------------------------------------------------------------
" Extended
"-----------------------------------------------------------------------------

Plugin 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plugin 'junegunn/fzf.vim'
Plugin 'preservim/tagbar'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
"Plugin 'chrisbra/Colorizer'
source ~/.extvimrc

call vundle#end()
filetype plugin indent on
" To ignore plugin indent changes, instead use:
"filetype plugin on


"-----------------------------------------------------------------------------
" Sets
"-----------------------------------------------------------------------------

set scrolloff=7
set timeout timeoutlen=500 ttimeoutlen=500
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
set backspace=indent,eol,start
set colorcolumn=+1
set termwinsize=10x200
set textwidth=79
" Don't format to 79 textwidth by default
set formatoptions=
set splitright

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
augroup linelength
    au BufEnter *.md,*.wiki,*.py,*.txt highlight OverLength ctermbg=darkgrey guibg=#592929
    au BufEnter *.md,*.wiki,*.py,*.txt match OverLength /\%80v.*/
    augroup END
" Cursos color
if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;blue\x7"
  " use a red cursor otherwisue
  let &t_EI = "\<Esc>]12;white\x7"
  silent !echo -ne "\033]12;white\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal and rxvt up to version 9.21
endif

"-----------------------------------------------------------------------------
" Color and visual settings
"-----------------------------------------------------------------------------

syntax on
colorscheme gruvbox
let g:airline_theme='badwolf'
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
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-w> <S-Right>
inoremap <C-b> <S-Left>
nnoremap <leader>] :nohl<CR>
nnoremap <leader>pi :PluginInstall<CR>
nnoremap <leader>ev :tabedit $HOME/.vimrc<CR>
nnoremap <leader>ee :tabedit $HOME/.extvimrc<CR>
nnoremap <leader>em :tabedit $HOME/.minvimrc<CR>
nnoremap <leader>et :tabedit $HOME/.tmux.conf<CR>
nnoremap <leader>ea :tabedit $HOME/.config/awesome/rc.lua<CR>
nnoremap <leader>es :tabedit $HOME/.config/sakura/sakura.conf<CR>
nnoremap <leader>vv :vsplit<CR>
" Select again deselected
nnoremap <leader>v V`]
" Indent select with Shift-< and Shift->
nnoremap <lt>> V`]<
nnoremap ><lt> V`]>
nnoremap =- V`]=
nnoremap <leader>q :wa<CR> :qa<CR>
" vim-surround
nnoremap <leader>( :normal viWS)<CR>
nnoremap <leader>[ :normal viWS]<CR>
nnoremap <leader>" :normal viWS"<CR>
nnoremap <leader>' :normal viWS'<CR>
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

