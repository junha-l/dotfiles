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


""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""" Coc """""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)<Paste>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

function! Search(word) abort
  return coc#rpc#notify('search', [a:word])
endfunction

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
nnoremap <silent> <space>f  :call Search(input('Enter word to search: '))<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" NeoFormat """""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neoformat_enabled_python = ['yapf']

augroup fmt
        autocmd!
        autocmd BufWritePre * undojoin | Neoformat
augroup end


""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" Theme """""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" AirLine """""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_section_z = ' %{strftime("%-I:%M %p")}' 
let g:airline_section_warning = ''


""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" EasyMotion """"""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" fzf-vim """"""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" General """""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
nnoremap <C-j> <C-W><C-j>
nnoremap <C-k> <C-W><C-k>
nnoremap <C-h> <C-W><C-h>
nnoremap <C-l> <C-W><C-l>
