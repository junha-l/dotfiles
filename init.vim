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

" custom functions
nmap <leader>f :Files<cr>
nmap <leader><Tab> :bnext<cr>
nmap <leader><S-Tab> :nprevious<cr>

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
map <leader>vimrc :tabe ~/.config/nvim/init.vim<cr>
map <leader>re :source $MYVIMRC<cr>
