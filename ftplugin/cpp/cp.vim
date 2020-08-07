augroup CppToolkit
	command! -nargs=0 CompileAndRun call cp#TermWrapper(printf('cv %s', expand('%')))
	command! -nargs=* CompileAndRunWithFile call cp#RunWithInput(<f-args>)
	nnoremap <F7> :CompileAndRun<CR>
	nnoremap <leader>cv :CompileAndRun<CR>
	nnoremap <F8> :CompileAndRunWithFile<CR>
	nnoremap <leader>cc :CompileAndRunWithFile<CR>
augroup END

