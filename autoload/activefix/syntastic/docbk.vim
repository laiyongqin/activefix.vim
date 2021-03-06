" this file is based on syntastic/syntax_checkers/docbk.vim
"============================================================================
"File:        docbk.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Martin Grenfell <martin.grenfell at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

"bail if the user doesnt have tidy or grep installed
if !executable("xmllint")
    finish
endif

function! activefix#syntastic#docbk#config()

    let makeprg="xmllint --xinclude --noout --postvalid ".shellescape(activefix#syntastic#expand_target('docbk', %:p))
    let errorformat='%E%f:%l: parser error : %m,%W%f:%l: parser warning : %m,%E%f:%l:%.%# validity error : %m,%W%f:%l:%.%# validity warning : %m,%-Z%p^,%-C%.%#,%-G%.%#'
    return { 'makeprg': makeprg, 'errorformat': errorformat }

    return loclist
endfunction
