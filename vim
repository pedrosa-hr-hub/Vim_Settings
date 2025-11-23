" ============================================================================
" Configurações básicas
" ============================================================================
set number
set relativenumber
set mouse=a
set encoding=utf-8
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
syntax on
set cursorline
set hlsearch
set incsearch
set ignorecase
set smartcase
set laststatus=2
set hidden              " Necessário para CoC
set nobackup            " Recomendado para CoC
set nowritebackup       " Recomendado para CoC
set updatetime=300      " Melhor experiência com CoC
set shortmess+=c        " Não passar mensagens para completion
set signcolumn=yes      " Sempre mostrar signcolumn

" ============================================================================
" vim-plug - Gerenciador de plugins
" ============================================================================
call plug#begin('~/.vim/plugged')

" --- Explorador de arquivos ---
Plug 'preservim/nerdtree'

" --- Sintaxe e highlighting ---
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" --- CoC (Conquer of Completion) ---
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-java'

" --- Git ---
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" --- Utilidades ---
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" --- Tmux integration ---
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'

" --- Temas ---
Plug 'ghifarit53/tokyonight-vim'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'

call plug#end()

" ============================================================================
" Configurações do Tokyo Night
" ============================================================================
let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
let g:tokyonight_transparent_background = 0
let g:tokyonight_menu_selection_background = 'green'
let g:tokyonight_current_word = 'bold'

" Ativar tema com suporte a true colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme tokyonight
set background=dark

" ============================================================================
" Airline
" ============================================================================
let g:airline_theme = 'tokyonight'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#coc#enabled = 1

" ============================================================================
" Tmux Integration
" ============================================================================
let g:tmux_navigator_no_mappings = 0
let g:tmux_navigator_save_on_switch = 1

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  set clipboard=unnamed
endif

" ============================================================================
" NERDTree
" ============================================================================
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=0
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeIgnore=['\.class$', '__pycache__', '\.git$', 'target', 'node_modules', '\.DS_Store']
let NERDTreeAutoDeleteBuffer=1
let NERDTreeQuitOnOpen=0
let NERDTreeHighlightCursorline=1
let NERDTreeWinSize=30

autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" ============================================================================
" CoC (Conquer of Completion)
" ============================================================================

" Usar Tab para navegar no autocomplete
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Enter para confirmar completion
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Usar Ctrl+Space para trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Navegar diagnósticos
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Mostrar documentação em preview
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight do símbolo sob cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Renomear símbolo
nmap <leader>rn <Plug>(coc-rename)

" Formatar código selecionado
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)

" Aplicar code action na seleção
xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)

" Code action no cursor
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
nmap <leader>as  <Plug>(coc-codeaction-source)

" Quick fix
nmap <leader>qf  <Plug>(coc-fix-current)

" Refactor
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Formatar arquivo inteiro
nmap <leader>fm :call CocAction('format')<CR>

" Organizar imports
nmap <leader>io :call CocActionAsync('runCommand', 'editor.action.organizeImport')<CR>

" Navegar na lista de erros/warnings
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Scroll no float window
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Selecionar função/classe (text objects)
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Comando para instalar/atualizar extensions do CoC
command! -nargs=0 CocUpdate :CocUpdate

" ============================================================================
" FZF
" ============================================================================
nnoremap <C-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>

" ============================================================================
" Navegação entre splits (compatível com Tmux)
" ============================================================================
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ============================================================================
" Atalhos úteis
" ============================================================================
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" ============================================================================
" Atalhos para alternar temas
" ============================================================================
nnoremap <F2> :colorscheme tokyonight<CR>:AirlineTheme tokyonight<CR>
nnoremap <F3> :colorscheme dracula<CR>:AirlineTheme dracula<CR>
nnoremap <F4> :colorscheme gruvbox<CR>:AirlineTheme gruvbox<CR>
nnoremap <F9> :colorscheme nord<CR>:AirlineTheme nord<CR>

nnoremap <leader>t1 :colorscheme tokyonight<CR>:AirlineTheme tokyonight<CR>
nnoremap <leader>t2 :colorscheme dracula<CR>:AirlineTheme dracula<CR>
nnoremap <leader>t3 :colorscheme gruvbox<CR>:AirlineTheme gruvbox<CR>
nnoremap <leader>t4 :colorscheme nord<CR>:AirlineTheme nord<CR>

" ============================================================================
" Compilar e executar Java
" ============================================================================
autocmd FileType java nnoremap <F5> :!javac % && java %:r<CR>
autocmd FileType java nnoremap <F6> :!./mvnw clean compile<CR>
autocmd FileType java nnoremap <F7> :!./mvnw test<CR>
autocmd FileType java nnoremap <F8> :!./mvnw spring-boot:run<CR>
nmap <leader>io :call CocActionAsync('runCommand', 'editor.action.organizeImport')<CR>

nnoremap <leader>mc :!./mvnw clean<CR>
nnoremap <leader>mi :!./mvnw clean install<CR>
nnoremap <leader>mt :!./mvnw test<CR>
nnoremap <leader>mr :!./mvnw spring-boot:run<CR>
