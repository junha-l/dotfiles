call plug#begin()

Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdcommenter'
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-gitgutter'
Plug 'joshdick/onedark.vim'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install -all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" neoformat
let g:neoformat_enabled_python = ['yapf']

augroup fmt
        autocmd!
        autocmd BufWritePre * undojoin | Neoformat
augroup end

" theme
syntax on
set background=dark
colorscheme onedark
hi Pmenu guibg=white guifg=black gui=bold
hi Normal guibg=NONE ctermbg=NONE
hi NonText guibg=NONE
hi Comment gui=BOLD
" highlight current line
augroup CursorLine
        au!
        au VimEnter,WinEnter,BufWinEnter,TabEnter,FocusGained,CmdwinEnter * setlocal cursorline
        au WinLeave,TabLeave,FocusLost,CmdwinLeave * setlocal nocursorline
augroup END

"let g:indentLine_setColors=0
let g:airline_theme='onedark'

" airline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_section_z = ' %{strftime("%-I:%M %p")}' 
let g:airline_section_warning = ''

" easymotion
" Gif config
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
map <leader>l <Plug>(easymotion-lineforward)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>h <Plug>(easymotion-linebackward)
map <leader>w <Plug>(easymotion-bd-w)
map <leader>w <Plug>(easymotion-overwin-w)
let g:EasyMotion_startofline = 0

" fzf-vim
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'Type'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Character'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" general config
set nu
set rnu
set incsearch ignorecase smartcase hlsearch
set ruler laststatus=2 showcmd showmode
set wrap breakindent
set encoding=utf-8
set number 
set title
set splitright
set splitbelow
set smartindent
set encoding=utf8
set fillchars=vert:│
autocmd Filetype python setlocal tabstop=2 softtabstop=2 shiftwidth=2
set expandtab
set updatetime=100
let mapleader=","
nmap <leader>vimrc :tabe ~/.config/nvim/init.vim<cr>
nmap <leader>r :source $MYVIMRC<cr>

" custom functions
nmap <leader>f :Files<cr>
nmap <leader><Tab> :bnext<cr>
nmap <leader><S-Tab> :nprevious<cr>
