" =================================
" ========== when cursor moved 
" =================================
augroup onCursorMoved
	autocmd!
	autocmd CursorMoved,CursorMovedI * call CentreCursor()
augroup END
" =================================
" ========== Latex 
" =================================

augroup onEnter
	autocmd!
	au FileType .tex,c,cpp call rainbow#load()
augroup END

" =================================
" ========== vimrc
" =================================


augroup saveChanges
	autocmd!
	exec 'autocmd BufWritePre ' . g:CONFIG_PATH . '/* :so $MYVIMRC'
augroup END
" =================================
" ========== dwm 
" =================================


augroup install_dwm
	autocmd!
	exec 'autocmd BufWritePre ' . g:SRC_PATH . '/dwm/* call MakeCleanInstallSuckless()'
augroup END

augroup install_dwmblocks
	autocmd!
	exec 'autocmd BufWritePre ' . g:SRC_PATH . '/dwmblocks/* call DwmblocksInstall() '
augroup END

augroup install_st
	autocmd!
	exec 'autocmd BufWritePre ' . g:SRC_PATH . '/st/* call MakeCleanInstallSuckless()'
augroup END

augroup install_dmenu
	autocmd!
	exec 'autocmd BufWritePre ' . g:SRC_PATH . '/dmenu/* call MakeCleanInstallSuckless()'
augroup END

augroup install_cfiles
	autocmd!
	exec 'autocmd BufWritePre ' . g:SRC_PATH . '/cfiles/* call MakeMakeInstall()'
augroup END



" =================================
" ========== One Vim Plug Startup 
" =================================
" autocmd VimEnter *
"   \  if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
"   \|   PlugInstall |
"   \| endif
" =================================
" ========== For competitive programing 
" =================================
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


augroup onEnterc
	autocmd!
	au FileType c,cpp call CreateCppDotFiles()
augroup END
