call plug#begin('~/.config/nvim/PlugIns/')

" for color and personalization
" Plug 'rafi/awesome-vim-colorschemes' "ide
" Plug 'vim-airline/vim-airline' "personalization for vim
Plug 'luochen1990/rainbow' " for colors in brackets and operators
Plug 'itchyny/lightline.vim'
" Plug 'pacha/vem-tabline' " for the tabline
"
" Plug 'vim-airline/vim-airline-themes' "temas
Plug 'ryanoasis/vim-devicons' "vim icons for windows 10
Plug 'junegunn/vim-easy-align' " for easy alignment
" =================================
" ========== for better motion 
" =================================

Plug 'easymotion/vim-easymotion'  " jump into words using a mapped array of positions


" =================================
" ========== for debbuging 
" =================================

Plug 'puremourning/vimspector' "debugging

" functionalities
Plug 'skywind3000/asyncrun.vim' "for Asyncrinous features
Plug 'junegunn/fzf', { 'do': './install --all' } | Plug 'junegunn/fzf.vim' " fzf for vim, search buffers etc
Plug 'junegunn/vim-peekaboo' " for showing registers before pasting anything
Plug 'ferrine/md-img-paste.vim' " paste files from clipboard into vim

" git integration
Plug 'tpope/vim-fugitive' " to see diff files

" snippets
Plug 'SirVer/ultisnips' " for snippets
" for latex
Plug 'xuhdev/vim-latex-live-preview' " for latex previews
" for cpp
Plug 'neoclide/coc.nvim', {'branch': 'release'} "for c++ support
Plug 'voldikss/vim-floaterm' " for the floating terminal
Plug 'cdelledonne/vim-cmake' " for generating cmake files

" for html code
Plug 'mattn/emmet-vim'

" for editing jupyter-notebookls in vim 
Plug 'untitled-ai/jupyter_ascending.vim'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } " for nvim in brave


" plugisn for c# and unity
Plug 'OmniSharp/omnisharp-vim'
" Plug 'dense-analysis/ale',{'for':['csharp','python'] } " for errors

" plugin for file exploring
Plug 'preservim/nerdtree'
Plug 'wesQ3/vim-windowswap'

" for colors in vim
Plug 'KabbAmine/vCoolor.vim'

" Plug 'RRethy/vim-hexokinase',{ 'do': 'make hexokinase' }

" now a plugin for live editing html css and bootstrap
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}


" water Linux plugins
Plug 'Virgilio-AI/vim-code-runner'
call plug#end()







