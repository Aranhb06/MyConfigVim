" =============================================================================
"  CONFIGURACIONES ESENCIALES
" =============================================================================
" --- Tecla lider ---
let mapleader = ' '

" --- Codificacion ---
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
set background=dark 

" --- Configuracion del tema ---
let g:moonflyTransparent = 1

highlight Pmenu      guibg=#3a3a3a guifg=#ffffff
highlight PmenuSel   guibg=#5f87ff guifg=#000000
highlight PmenuSbar  guibg=#444444
highlight PmenuThumb guibg=#bbbbbb
highlight VertSplit guibg=NONE guifg=#444444

" =============================================================================
"  VIM-PLUG Y PLUGINS
" =============================================================================
call plug#begin()
    " --- ÍCONOS (Cárgalo primero para que otros plugins los usen) ---
    Plug 'ryanoasis/vim-devicons'

    " --- Barra de Estado y Temas ---
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'bluz71/vim-moonfly-colors'

    " --- Utilidades ---
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-commentary'

    " --- Autocompletado y LSP ---
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " ---- Plugin para visualizar markdown ----
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install' }

    " --- Plugin para ejecutar comando de forma asincrona --
    Plug 'skywind3000/asyncrun.vim'

    " --- Plugin para terminal
    Plug 'voldikss/vim-floaterm'

    " --- Coleccion de snippets ---
    Plug 'honza/vim-snippets'

call plug#end()

" =============================================================================
"  APLICAR TEMA Y AJUSTES DE COLOR
" =============================================================================
"1. Carga el tema de color.
colorscheme moonfly

" 2. Colores de la numeración para que sea transparente y resalte.
highlight LineNr       guibg=NONE guifg=#888888
highlight CursorLineNr guibg=NONE guifg=#dcdcaa gui=bold

" 3. Poner los comentarios (notas) en cursiva.
highlight Comment gui=italic

" =============================================================================
"  CONFIGURACIÓN DE PLUGINS
" =============================================================================
" --- VIM-AIRLINE ---
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='moonfly'

" --- COC.NVIM ---
let g:coc_global_extensions = [
        \ 'coc-tsserver', 
        \ 'coc-json', 
        \ 'coc-html', 
        \ 'coc-css', 
        \ 'coc-pyright', 
        \ 'coc-explorer', 
        \ 'coc-sh', 
        \ 'coc-snippets', 
        \ 'coc-highlight',
        \ ]

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

" Mapeo de teclas para diagnosticos 
nnoremap <silent> d[ <Plug>(coc-diagnostic-prev)
nnoremap <silent> d] <Plug>(coc-diagnostic-next)

" Mapeo de teclas para ver la documentacion 
nnoremap <silent> K :call ShowDocumentation()<CR>

" Mappings Code Actions
" nnoremap ga <Plug>(coc-codeaction-cursor)

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
nnoremap <silent> <leader>e :CocCommand explorer<CR>

" --- FLOATERM ---
let g:floaterm_title = 'TERMINAL $1/$2'
let g:floaterm_rootmarkers = [
        \ '.git',
        \ '.hg',
        \ '.svn',
        \ 'package.json',
        \ 'pyproject.toml',
        \ 'Cargo.toml',
        \ '.root',
        \ ]

" =============================================================================
"  MAPPINGS GENERALES
" =============================================================================
" --- NAVEGACIÓN DE VENTANAS ---
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" --- REDIMENSIONAR VENTANAS ---
nnoremap <silent> <C-Left> :vertical resize -5<CR>   " Estrechar (mover borde a izquierda)
nnoremap <silent> <C-Right> :vertical resize +5<CR>  " Ensanchar (mover borde a derecha)
nnoremap <silent> <C-Up> :resize +2<CR>     " Más alta
nnoremap <silent> <C-Down> :resize -2<CR>   " Más baja

" --- ROTAR VENTANA A HORIZONTAL Y VERTICAL
nnoremap <silent> <leader><Up>  <C-w>K
nnoremap <silent> <leader><Left> <C-w>H

" --- GESTIÓN DE FICHEROS ---
nnoremap <silent> <leader>q :q<CR>
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>x :wq<CR>

" --- FZF (FUZZY FINDER) ---
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-f> :Rg<CR>
nnoremap <silent> <leader>l :Lines<CR>

" --- TERMINAL ---
" Funcion matar la terminal
function! KillAndShowNext()
    let total_terminals = len(floaterm#buflist#gather())
    FloatermKill
    if total_terminals > 1
        FloatermToggle
    endif
endfunction

" Atajo <Leader>t: MUESTRA / OCULTA la terminal. Si no existe, CREA LA PRIMERA.
let g:floaterm_keymap_toggle = '<Leader>t'
tnoremap <silent> <Leader>t <C-\><C-n>:FloatermToggle --cwd=<buffer-root><CR>

" Atajo Ctrl+t: CREA una nueva terminal en la RAÍZ DEL PROYECTO DEL ARCHIVO ACTUAL.
nnoremap <silent> <C-t> :FloatermNew --cwd=<buffer-root><CR>
tnoremap <silent> <C-t> <C-\><C-n>:FloatermNew --cwd=<buffer-root><CR>

"Atajos Ctrl+j/k: NAVEGAR entre terminales (SOLO DENTRO DE FLOATERM).
tnoremap <silent> <C-j> <C-\><C-n>:FloatermNext<CR>
tnoremap <silent> <C-k> <C-\><C-n>:FloatermPrev<CR>

" Atajo 'rt': CIERRE INTELIGENTE CONTEXTUAL (remove terminal).
nnoremap <silent> rt :FloatermKill!<CR>
tnoremap <silent> rt <C-\><C-n>:call KillAndShowNext()<CR>

" =============================================================================
"  CONFIGURACIÓN DE MARKDOWN-PREVIEW.NVIM
" =============================================================================
" 1. Habilita edicion de markdown
let g:mkdp_filetypes = ['markdown']

" 2. Habilita la actualización instantánea mientras escribes, sin necesidad de guardar.
let g:mkdp_refresh_on_text_changed = 1

" 3. Cierra automáticamente la ventana de vista previa cuando cambias a un buffer que no sea Markdown.
let g:mkdp_auto_close = 1

" =============================================================================
"  VISTA PREVIA INTELIGENTE (F5)
" =============================================================================

" 1. LA FUNCIÓN QUE DECIDE QUÉ HACER
" -----------------------------------------------------------------------------
function! SmartPreview()
    if &filetype == 'markdown'
        execute 'MarkdownPreviewToggle'

    elseif &filetype == 'html'
        execute 'AsyncRun -cwd=%:h live-server --open=%:t'

    else
        echo "No hay acción de vista previa definida para el tipo de archivo:" &filetype
    endif
endfunction

" 2. LOS ATAJOS DE TECLADO
" -----------------------------------------------------------------------------
" Con F5, llama a la función inteligente que hemos creado
nnoremap <silent> <F5> :call SmartPreview()<CR>

" Con Shift+F5, detiene el proceso en segundo plano (el live-server)
nnoremap <silent> <S-F5> :AsyncStop<CR>
