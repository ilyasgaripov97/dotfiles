call plug#begin()
" The default plugin directory will be as follows:

" requires npm install --save typescript typescript-language-server
Plug 'neovim/nvim-lspconfig'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'neoclide/coc.nvim'
Plug 'cohama/lexima.vim'
Plug 'mattn/emmet-vim'

Plug 'gruvbox-community/gruvbox'
Plug 'AlessandroYorba/Alduin'

Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" Initialize plugin system
call plug#end()

" Indentation & Syntax

set expandtab
set textwidth=80
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent

set ruler
syntax on

" Searching

set nohlsearch
set incsearch

" Layout

set nowrap
set scrolloff=24
set signcolumn=yes

" Any

set hidden
set noerrorbells
set guicursor=

" Mappings

:lua require('telescope').setup{  defaults = { file_ignore_patterns = { "node_modules", "coverage" }} }

let mapleader = "\\"
nnoremap <leader><leader> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Colors & Schemes

set background=dark
colorscheme alduin

