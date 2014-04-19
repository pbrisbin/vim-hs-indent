" Vim indent file
" Language:    Haskell
" Maintainer:  Pat Brisbin <pbrisbin@gmail.com>
" Created:     2014 Apr 18
" Last Change: 2014 Apr 18
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
  let prev_indent = indent(a:line_num - 1)

  if a:line_num == 0
    return 0
  end

  if s:PartialExpression(prev_line)
    return prev_indent + &shiftwidth
  end

  return prev_indent
endfunction

function s:PartialExpression(code)
  return
    \ s:BeginsModule(a:code) ||
    \ s:BeginsDataType(a:code)
endfunction

function s:BeginsModule(code)
  return a:code =~ '^module' && a:code !~ 'where'
endfunction

function s:BeginsDataType(code)
  return a:code =~ '^data'
endfunction
