
  "mage} ================================= ========== Main Variables 
" " =================================
" 
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

" =================================
" ========== buffer variables 
" =================================
augroup BufferVariables
au BufEnter * let b:FilePathNoExtension = expand("%:r") " path/main
au BufEnter * let b:Extension = expand("%:e") " tex
au BufEnter * let b:FileName = expand("%:t") " main.tex
au BufEnter * let b:FilePath = expand("%") " path/main.tex
au BufEnter * let b:FileNameNoExtension = expand("%:t:r") " main
au BufEnter * let b:CurrentFolder = expand("%:p:h") "pathFolder/folder
augroup end
" for copy paste

let g:mdip_imgdir='img_' . expand("%:t:r")
" !!!!!=================================
" !!!!!========== Source files 
" !!!!!=================================

exec 'source ' . g:CONFIG_PATH . '/PlugIns.vim'
exec 'source ' . g:CONFIG_PATH . '/header_shortcuts.vim'
exec 'source ' . g:CONFIG_PATH . '/header_autocmds.vim'
exec 'source ' . g:CONFIG_PATH . '/header_skeletons.vim'
exec 'source ' . g:CONFIG_PATH . '/shortcuts.vim'
exec 'source ' . g:CONFIG_PATH . '/IconsAndThemes.vim'
exec 'source ' . g:CONFIG_PATH . '/colors.vim'
exec 'source ' . g:CONFIG_PATH . '/autocmds.vim'
exec 'source ' . g:CONFIG_PATH . '/skeletons.vim'
exec 'source ' . g:CONFIG_PATH . '/customCommands.vim'


" =================================
" ========== PlugIn Variables 
" =================================
" LeetCode:


" install coc omnisharp by default
let g:coc_global_extensions=['coc-omnisharp']
let g:coc_global_extensions=['coc-pyright']

"let g:OmniSharp_highlighting = 0
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_server_use_mono = 1

" use for correcting issues
let g:ale_linters = {
\ 'cs': ['OmniSharp'],
\ 'python':['pyright','mypy','pylint'],
\ 'c':[],
\}


 let g:OmniSharp_server_use_mono = 1
let g:livepreview_previewer = 'zathura'    " For Latex
let NERDTreeIgnore = ['\.aux$','\.idx','\.out$','\.log']   " PlugIn NerdTree
let g:NERDTreeHijackNetrw=1    " PlugIn NerdTree
let g:UltiSnipsExpandTrigger="<tab>"    " PlugIn UltiSnips
let g:UltiSnipsEditSplit="vertical"   " PlugIn UltiSnip
let g:rainbow_active = 0
let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['Blue', 'Yellow', 'Cyan', 'Magenta','Red'],
\	'guis': [''],
\	'cterms': [''],
\	'operators': '_,\|+\|-\|*\|\/\|===\|!==\|!==\|==\|=\|!\|<\|>\|&\|&&_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'markdown': {
\			'parentheses_options': 'containedin=markdownCode contained', 
\		},
\		'cpp': {
\			'operators': '_,\+\-\|*\|===\|!==\|!==\|==\|=\|!\|<\|>\|&\|&&_',
\		},
\		'c': {
\			'operators': '_,\+\-\|*\|===\|!==\|!==\|==\|=\|!\|<\|>\|&\|&&_',
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'], 
\		},
\		'haskell': {
\			'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'], 
\		},
\		'vim': {
\		'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\		},
\		'perl': {
\			'syn_name_prefix': 'perlBlockFoldRainbow', 
\		},
\		'tex': {
	\	'parentheses': [ ' start=/\$/ end=/\$/ ' , 'start=/\$\$/ end=/\$\$/ ' , 'start=/\\begin{large}/ end=/\\end{large}/ ','start=/\\begin{Large}/ end=/\\end{Large}/ ','start=/\\begin{LARGE}/ end=/\\end{LARGE}/ ','start=/\\begin{itemize}/ end=/\\end{itemize}/ ','start=/\\begin{tikzpicture}/ end=/\\end{tikzpicture}/ ','start=/\\begin{document}/ end=/\\end{document}/ ','start=/\\begin{paracol}/ end=/\\end{paracol}/ ','start=/\\begin{rightcolumn}/ end=/\\end{rightcolumn}/ ','start=/\\begin{leftcolumn}/ end=/\\end{leftcolumn}/ ' ,'start=/{/ end=/}/' , 'start=/\\begin{cvsection}/ end=/\\end{cvsection}/' , ' start=/\\begin{minipage}/ end=/\\end{minipage}/ '
		\],
	\			'operators': '_._',
\		},
\		'css': 0, 
\	}
\}
let g:minimap_width = 10

let g:Hexokinase_highlighters = ['backgroundfull']


" =================================
" ========== Set variables 
" =================================
"
"

" for colors
set showtabline=2
set termguicolors
set foldmethod=indent
set foldnestmax=1
set wildmenu
set wildmode=longest,list,full

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
set scrolloff=10 " keep the mouse centerd

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

