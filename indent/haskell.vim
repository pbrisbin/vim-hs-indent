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
  let prev_line   = getline(a:line_num - 1)
  let prev_indent = indent(prev_line)

  if a:line_num == 0
    return 0
  end

  if prev_line =~ '^\(module\|\s*[(,]\)'
    return prev_indent + 5
  end

  if prev_line =~ '^\s*)'
    return prev_indent - 5
  end

  return prev_indent
endfunction
