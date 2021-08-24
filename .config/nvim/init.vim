
" =================================
" ========== Main Variables 
" =================================

let g:CONFIG_PATH = '~/.config/nvim'
let g:USER = "rockhight"
let g:GROUP = "wheel"
let g:CUR_PATH = expand('%:p:h')
let g:FILE_MANAGER='cfiles'
let g:SRC_PATH='~/.local/src'
let g:tex_flavor='latex'
let &directory = expand( g:CONFIG_PATH .'/.vimdata/swap//')
let &backupdir = expand( g:CONFIG_PATH . '/.vimdata/backup//')
let &undodir = expand(   g:CONFIG_PATH . '/.vimdata/undo//')
" !!!!!=================================
" !!!!!========== Source files 
" !!!!!=================================

exec 'source ' . g:CONFIG_PATH . '/PlugIns.vim'
exec 'source ' . g:CONFIG_PATH . '/header_shortcuts.vim'
exec 'source ' . g:CONFIG_PATH . '/header_autocmds.vim'
exec 'source ' . g:CONFIG_PATH . '/shortcuts.vim'
exec 'source ' . g:CONFIG_PATH . '/IconsAndThemes.vim'
exec 'source ' . g:CONFIG_PATH . '/colors.vim'
exec 'source ' . g:CONFIG_PATH . '/autocmds.vim'
" =================================
" ========== PlugIn Variables 
" =================================

let g:livepreview_previewer = 'zathura'    " For Latex
let NERDTreeIgnore = ['\.aux$','\.idx','\.out$','\.log']   " PlugIn NerdTree
let g:NERDTreeHijackNetrw=1    " PlugIn NerdTree
let g:UltiSnipsExpandTrigger="<tab>"    " PlugIn UltiSnips
let g:UltiSnipsEditSplit="vertical"   " PlugIn UltiSnip
let g:rainbow_ctermfgs = ['blue', 'green', 'yellow', 'red', 'magenta']   "PlugIn rainbow pair colorizer

" =================================
" ========== Set variables 
" =================================
exec 'set viminfo+=n' . g:CONFIG_PATH . '/.vimdata/viminfo '
set encoding=utf-8
set fileencoding=utf-8
set clipboard=unnamedplus
set shiftwidth=3
set tabstop=3
set nu
set rnu
set autochdir
:set re=1
set mouse =a
set backup
set undofile
set listchars=tab:\|-→,trail:~
set cursorcolumn
set showbreak=ʭ
set linebreak
set list
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
"set shortmess=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif




" no highlight errors
:hi Error NONE
:hi ErrorMsg NONE


" =================================================================================
" ==================================== backup data ================================
" =================================================================================

if !isdirectory(&undodir) | call mkdir(&undodir, "p") | endif
if !isdirectory(&backupdir) | call mkdir(&backupdir, "p") | endif
if !isdirectory(&directory) | call mkdir(&directory, "p") | endif

