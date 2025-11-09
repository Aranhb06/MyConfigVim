" =============================================================================
"  PLUGINS
" =============================================================================
call plug#begin()
    " --- Barra de Estado y Temas ---
    " Iconos 
    Plug 'ryanoasis/vim-devicons'

    " Barra de estado
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Tema
    Plug 'bluz71/vim-moonfly-colors'

    " --- Utilidades ---
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-commentary'
    Plug 'markonm/traces.vim'

    " --- Autocompletado y LSP ---
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " ---- Plugin para visualizar markdown ----
    Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app && npm install' }

    " --- Plugin para ejecutar comando de forma asincrona --
    Plug 'skywind3000/asyncrun.vim'

    " --- Plugin para terminal
    Plug 'voldikss/vim-floaterm'

    " --- Coleccion de snippets ---
    Plug 'honza/vim-snippets'

call plug#end()


" =============================================================================
"  CONFIGURACIONES ESENCIALES
" =============================================================================
" --- Configuraciones Generales ---
" Tecla lider
let mapleader = ' ' 

" Codificacion
set encoding=utf-8

" Otras configuraciones
set mouse=a
set clipboard=unnamedplus
set nu
set rnu
set showmode
set autoindent
set tabstop=4
set expandtab
syntax on

" --- Configuraciones (Colores y UI) ---
" Configuraciones del tema
let g:moonflyTransparent = 1
colorscheme moonfly
highlight LineNr       guibg=NONE guifg=#888888
highlight CursorLineNr guibg=NONE guifg=#dcdcaa gui=bold

" Configuraciones de la barra de estado (vim-airline)
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='moonfly'

" --- Mappings Generales ---
" Navegacion entre ventanas
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Redimensionar ventanas 
nnoremap <silent> <C-Left> :vertical resize -5<CR>   " Estrechar (mover borde a izquierda)
nnoremap <silent> <C-Right> :vertical resize +5<CR>  " Ensanchar (mover borde a derecha)
nnoremap <silent> <C-Up> :resize +2<CR>     " Más alta
nnoremap <silent> <C-Down> :resize -2<CR>   " Más baja

" Rotar ventana 
nnoremap <silent> <leader><Up>  <C-w>K
nnoremap <silent> <leader><Left> <C-w>H

" Gestion del fichero 
nnoremap <silent> <leader>q :q<CR>
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>x :wq<CR>


" =============================================================================
"  CONFIGURACIONES EXTENDIAD
" =============================================================================

" --- Configuraciones COC ---
" Lista de extensiones de coc
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
        \ 'coc-rls',
        \ 'coc-docker',
        \ ]
 
" Mappings Go To's
nmap <silent> gD <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gR <Plug>(coc-references)

" Confirmar selección con Enter 
inoremap <expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Navegar con Ctrl+j / Ctrl+k cuando el menú de coc esté visible
inoremap <silent><expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
inoremap <silent><expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
noremap <silent><expr> <c-space> coc#refresh()

" Navegar entre campos de un snippets
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

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

" --- Coc explorer ---
nnoremap <silent> <leader>e :CocCommand explorer<CR>

" --- Configuraciones de COMMENTARY 
nmap c <Plug>Commentary
nmap cc <Plug>CommentaryLine
nmap cp cap
xmap c <Plug>Commentary

" --- Configuraciones de FZF ---
" Configuraciones generales
nnoremap <silent> <leader>l :Lines<CR>
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>c :Commands<CR>
nnoremap <silent> <leader>m :Marks<CR>
nnoremap <silent> <leader>W :Windows<CR>
nnoremap <silent> <leader>C :Changes<CR>
nnoremap <silent> <leader>j :Jumps<CR>

" Integracion con git
nnoremap <silent> gc :Commits<CR>
nnoremap <silent> gcB :BCommits<CR>
nnoremap <silent> gf :GFiles<CR>
nnoremap <silent> gf? :GFiles?<CR>
 
" --- Configuraciones de FUGITIVE --- 
nnoremap <silent> <leader>g :G<CR> 
nnoremap <silent> gd :Gdiff<CR> 
nnoremap <silent> gw :Gwrite<CR> 
nnoremap <silent> gr :Gread<CR> 
nnoremap <silent> grm :Gremove<CR> 
nnoremap <silent> gm :Gremove<CR> 

" --- Configuracioens de FLOATERM ---
" Configuraciones generales
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

" Mappings
function! KillAndShowNext()
    let total_terminals = len(floaterm#buflist#gather())
    FloatermKill
    if total_terminals > 1
        FloatermToggle
    endif
endfunction

let g:floaterm_keymap_toggle = '<Leader>t'
tnoremap <silent> <Leader>t <C-\><C-n>:FloatermToggle --cwd=<buffer-root><CR>
nnoremap <silent> <C-t> :FloatermNew --cwd=<buffer-root><CR>
tnoremap <silent> <C-t> <C-\><C-n>:FloatermNew --cwd=<buffer-root><CR>
tnoremap <silent> <C-j> <C-\><C-n>:FloatermNext<CR>
tnoremap <silent> <C-k> <C-\><C-n>:FloatermPrev<CR>
nnoremap <silent> rt :FloatermKill!<CR>                                          
tnoremap <silent> rt <C-\><C-n>:call KillAndShowNext()<CR>

" --- Configuraciones Markdown preview ---
" Edicion de markdown
let g:mkdp_filetypes = ['markdown']

" Habilita la actualización instantánea mientras escribes, sin necesidad de guardar.
let g:mkdp_refresh_on_text_changed = 1

" Cierra automáticamente la ventana de vista previa cuando cambias a un buffer que no sea Markdown.
let g:mkdp_auto_close = 1


" =============================================================================
"  VISTA PREVIA INTELIGENTE (F5)
" =============================================================================
function! SmartPreview()
    if &filetype == 'markdown'
        execute 'MarkdownPreviewToggle'

    elseif &filetype == 'html'
        execute 'AsyncRun -cwd=%:h live-server --open=%:t'

    else
        echo "No hay acción de vista previa definida para el tipo de archivo:" &filetype

    endif
endfunction

" Con F5, llama a la función inteligente que hemos creado
nnoremap <silent> <F5> :call SmartPreview()<CR>

" Con Shift+F5, detiene el proceso en segundo plano (el live-server)
nnoremap <silent> <S-F5> :AsyncStop<CR>
