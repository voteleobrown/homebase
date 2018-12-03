" Mdorg - Org-alternative using Markdown
" Language:	Markdown
" Maintainer: 	Leo Brown <me@leobrown.net>
" Last Change: 	2018-10-16

setlocal conceallevel=2

runtime! syntax/markdown.vim

set foldcolumn=4
set ruler
set number
set laststatus=2
set cursorline

function! MarkdownFolds()
  let thisline = getline(v:lnum)
  if match(thisline, '^*TODO') >= 0
	  return ">4"
  elseif match(thisline, '^###') >= 0
	  return ">3"
  elseif match(thisline, '^##') >= 0
	  return ">2"
  elseif match(thisline, '^#') >= 0
	  return ">1"
  else
	  return "="
  endif
  return "1"
endfunction

function! MarkdownFoldText()
	let foldsize = (v:foldend-v:foldstart)
	return getline(v:foldstart).' ('.foldsize.' lines)'
endfunction


setlocal foldmethod=expr
setlocal foldexpr=MarkdownFolds()
setlocal foldtext=MarkdownFoldText()

" Bold text.
syntax region mkdBold matchgroup=mkdMarker start=/\\\@<!\*\*/ end=/\\\@<!\*\*/ concealends
