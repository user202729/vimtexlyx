" Vim plugin to use LyX as the editor for math formula in TeX files
" Last Change: 2022-02-02
" License: GNU GPL v3

if exists("g:loaded_vimtexlyx")
  finish
endif
let g:loaded_vimtexlyx = 1
let s:save_cpo = &cpo
set cpo&vim

if 0
	call tempname()
	call delete("e.lyx")
	call system("tex2lyx -fixedenc utf8 e.tex e.lyx")  " for some reasons -e doesn't work
	let content=readfile("e.lyx", "b")
	let content2=readfile("e.lyx", "b")
	if content!=content2
		call system("lyx e.lyx -E latex e2.tex")
		let content=readfile("e2.tex")
		let content=content[index(content, '\begin{document}')+1:index(content, '\end{document}')-1]
		echo join(content, "\n")
	endif
endif

let &cpo = s:save_cpo
unlet s:save_cpo
