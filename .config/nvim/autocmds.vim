
augroup onEnter
	autocmd!
	au FileType python,tex,c,cpp,c++ :RainbowToggle
augroup END

augroup saveChanges
	autocmd!
	exec 'autocmd BufWritePre ' . g:CONFIG_PATH . '/* :so $MYVIMRC'
augroup END

augroup changeModifiable
	autocmd!
	autocmd BufReadPost * call UpdateModifiable()
augroup END


augroup python
	autocmd!
	" Add shiftwidth and/or softtabstop if you want to override those too.
	autocmd FileType python setlocal noexpandtab shiftwidth=3 tabstop=3
	autocmd FileType python let g:PasteImageFunction = 'g:PythonPasteImage'
	autocmd FileType python let g:ale_set_hightlihgts = 0
augroup end


" =================================
" ========== install vim plug ins on startup 
" =================================
augroup ViEnter
	autocmd!
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
augroup end
