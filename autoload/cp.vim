" for detecting OS
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

function! cp#TermWrapper(command) abort
	if !exists('g:split_term_style') | let g:split_term_style = 'vertical' | endif
	if g:split_term_style ==# 'vertical'
		let buffercmd = 'below vnew'
	elseif g:split_term_style ==# 'horizontal'
		let buffercmd = 'below new'
	else
		echoerr 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'' but is currently set to ''' . g:split_term_style . ''')'
		throw 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'')'
	endif
	exec buffercmd . ' | term ' . a:command
	if exists('g:split_term_resize_cmd')
		exec g:split_term_resize_cmd
	endif
	exec 'startinsert'
endfunction

function! cp#RunWithInput(...) abort
	let l:default_input_name = expand('%:r') . 'in'
	let l:input_file_name = get(a:, 1, l:default_input_name)
	call cp#TermWrapper(printf('cv %s < %s', expand('%'), l:input_file_name))
endfunction

let g:split_term_style = 'horizontal'
let g:split_term_resize_cmd = 'resize 20'
