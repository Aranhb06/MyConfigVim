" =============================================================================
"  CONFIGURACIONES ESENCIALES
" =============================================================================
" --- CODIFICACIÓN (SOLUCIÓN PRINCIPAL) ---
" Esto le dice a Vim que use UTF-8, permitiendo que muestre los íconos.
set encoding=utf-8

" --- Configuraciones Generales ---
set nu
set rnu
set showmode
set autoindent
set tabstop=4
set expandtab
syntax on

" --- Colores y UI ---
" Usa colores 24-bit (True Color)
set termguicolors
highlight Pmenu      guibg=#3a3a3a guifg=#ffffff
highlight PmenuSel   guibg=#5f87ff guifg=#000000
highlight PmenuSbar  guibg=#444444
highlight PmenuThumb guibg=#bbbbbb
highlight VertSplit guibg=#3a3a3a guifg=#444444

" =============================================================================
"  VIM-PLUG Y PLUGINS
" =============================================================================
call plug#begin()
    " --- ÍCONOS (Cárgalo primero para que otros plugins los usen) ---
    Plug 'ryanoasis/vim-devicons'

    " --- Barra de Estado y Temas ---
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " --- Utilidades ---
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " --- Autocompletado y LSP ---
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " --- Coleccion de snippets
    Plug 'honza/vim-snippets'
    Plug 'ryanoasis/vim-devicons'

call plug#end()

" =============================================================================
"  CONFIGURACIÓN DE PLUGINS
" =============================================================================
" --- VIM-AIRLINE ---
" Habilita el uso de Nerd Fonts en la barra de estado (SOLUCIÓN #2)
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='wombat'

" --- COC.NVIM ---
let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-html', 'coc-css', 'coc-pyright', 'coc-explorer', 'coc-sh','coc-snippets']
" Mappings Go To's
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gR <Plug>(coc-references)

" Mappings Completion
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Mappings Diagnostics
nnoremap <silent> d[ <Plug>(coc-diagnostic-prev)
nnoremap <silent> d] <Plug>(coc-diagnostic-next)

" Mappings Hover Documentation
nnoremap <silent> K :call ShowDocumentation()<CR>

" Mappings Code Actions
nnoremap ga <Plug>(coc-codeaction-cursor)

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Configuracion de coc-explorer
nnoremap <silent> <space>e :CocCommand explorer<CR>

" =============================================================================
"  MAPPINGS GENERALES
" =============================================================================
" Moverse entre ventanas con Ctrl + (h, j, k, l)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Alternar entre ventanas con <Tab>
nnoremap <Tab> <C-w>w

" Cerrar ventana, guardar, guardar + cerrar ventana

nnoremap <silent> <space>q :q<CR>
nnoremap <silent> <space>w :w<CR>
nnoremap <silent> <space>x :wq<CR>
