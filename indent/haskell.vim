" Vim indent file
" Language:    Haskell
" Maintainer:  Pat Brisbin <pbrisbin@gmail.com>
" Created:     2014 Apr 18
" Last Change: 2014 Apr 18
"
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetHaskellIndent(v:lnum)

if exists("*GetHaskellIndent")
  finish
endif

function GetHaskellIndent(line_num)
  return 4
endfunction
