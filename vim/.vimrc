" Vim Configurations
" vim: set fdm=marker :

" Vim-Plug Install Plugins {{{
call plug#begin('~/.vim/plugged')

" Plug 'Yggdroot/indentLine'
" Plug 'lifepillar/vim-mucomplete'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'skywind3000/quickmenu.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Color Schemes
Plug 'ayu-theme/ayu-vim'
Plug 'rakr/vim-one'
Plug 'sainnhe/sonokai'

call plug#end()
" }}}

" Misc {{{
syntax on
filetype plugin on

set nowrap
set noswapfile
set nocompatible

set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
set expandtab

set list
set listchars=tab:<->,space:·

set mouse=a " Allows mouse
set cursorline " Always show cursor
set number " Always show line number

let mapleader = ' '
" }}}

" Command Alias {{{
command! W w
command! Q q
command! WQ wq
command! Wq wq
command! Evimrc e ~/.vimrc
command! Wvimrc w | source ~/.vimrc
" }}}

" Appearance {{{
if has("gui_running")
  set background=light
  let g:one_allow_italics = 1
  colorscheme one

  set guifont=Iosevka\ Term\ Extended:h15
  set guioptions=e
  set linespace=0
  set transparency=10
  set macligatures
else
  if has('termguicolors')
    set termguicolors
  endif

  " let g:sonokai_enable_italic = 1
  " colorscheme sonokai
  set background=dark
  let g:one_allow_italics = 1
  colorscheme one

  highlight Normal guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
endif
" }}}

" MuComplete {{{
" set completeopt+=menuone
" set completeopt+=noselect
" set shortmess+=c " Shut off completion messages
" let g:mucomplete#enable_auto_at_startup = 1
" }}}

" Coc.nvim {{{
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

set updatetime=1000

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Show CoC error indicator in the line number column
if has("patch-8.1.1564")
  set signcolumn=number
else
  " For neovim compatible, should not need this after neovim 5.0
  set signcolumn=yes
endif

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" <leader> to show hover
function! s:show_hover()
  if (coc#rpc#ready())
    silent call CocActionAsync('doHover')
  endif
endfunction

nnoremap <silent> <leader> :call <SID>show_hover()<CR>

" Use Tab or Enter to confirm completion
inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<Tab>"
inoremap <silent><expr> <CR>  pumvisible() ? coc#_select_confirm() : "\<CR>"

" Use `<leader>[` and `leader]` to navigate diagnostics
nmap <silent> <leader>[ <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>] <Plug>(coc-diagnostic-next)

" " GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Formatting selected code.
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>ca <Plug>(coc-codeaction-selected)
nmap <leader>ca <Plug>(coc-codeaction-selected)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Use K to show documentation in preview window.
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
nnoremap <silent> <leader>d :call <SID>show_documentation()<CR>

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" if has('nvim-0.4.0') || has('patch-8.2.0750')
"   nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"   inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"   vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" endif

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" }}}

" Airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0
nmap <leader><Left> <Plug>AirlineSelectPrevTab
nmap <leader><Right> <Plug>AirlineSelectNextTab
" }}}

" NERDCommenter {{{
let NERDSpaceDelims=1

" Bind Control + n to toggle comment
" inoremap <leader>/ :call NERDComment('n', 'toggle')<CR>
nnoremap <leader>/ :call NERDComment('n', 'toggle')<CR>
vnoremap <leader>/ :call NERDComment('v', 'toggle')<CR>
" }}}

" NERDTree {{{
let NERDTreeShowHidden = 1
let g:NERDTreeWinSize=20
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeIgnore = ['node_modules', '.git', '.DS_Store']

nnoremap <leader><leader><leader> :NERDTreeToggle<CR>
" }}}

" QuickMenu.vim {{{
let g:quickmenu_padding_right=1
let g:quickmenu_padding_left=1
let g:quickmenu_options='HL'

call quickmenu#reset()
call quickmenu#append('ESLint: Auto-Fix', 'CocCommand eslint.executeAutofix', '', 'javascript,javascriptreact')
" call quickmenu#append('Prettier: Format File', 'CocCommand prettier.formatFile')
call quickmenu#append('CoC: Show Code Actions', "call CocActionAsync('codeAction')")
call quickmenu#append('CoC: Rename', "call CocActionAsync('rename')")
call quickmenu#append('CoC: Format', "call CocAction('format')")
call quickmenu#append('CoC: Organize Import', 'CocCommand editor.action.organizeImport')
call quickmenu#append('Reload', 'source ~/.vimrc', 'Reload .vimrc')

" Double-tap <leader> to openn QuickMenu
nnoremap <silent> <leader><leader> :call quickmenu#bottom(0)<CR>
nnoremap <silent> <leader><CR> :call quickmenu#bottom(0)<CR>
" }}}

" FZF {{{
let $FZF_DEFAULT_COMMAND = 'fd -H -E node_modules -E .git -E .DS_Store -E tmp/jest --no-ignore-vcs'

" Ctrl-p to open FZF
nnoremap <leader>go :Files<CR>
" }}}

" General Keybindings {{{
" Map <leader>v to start block visual
nnoremap <silent> <leader>v <C-v>

" Map <leader>-hjkl to move focus
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
" }}}
