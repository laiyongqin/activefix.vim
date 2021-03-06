" this file is based on syntastic/syntax_checkers/javascript/jsl.vim
"============================================================================
"File:        jsl.vim
"Description: Javascript syntax checker - using jsl
"Maintainer:  Martin Grenfell <martin.grenfell at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"============================================================================
if !exists("g:syntastic_javascript_jsl_conf")
    let g:syntastic_javascript_jsl_conf = ""
endif

function! activefix#syntastic#javascript#jsl#config()
    let makeprg = "jsl " . g:syntastic_javascript_jsl_conf . " -nologo -nofilelisting -nosummary -nocontext -process ".shellescape(activefix#syntastic#expand_target('javascript/jsl', '%'))
    let errorformat='%W%f(%l): lint warning: %m,%-Z%p^,%W%f(%l): warning: %m,%-Z%p^,%E%f(%l): SyntaxError: %m,%-Z%p^,%-G'
    return { 'makeprg': makeprg, 'errorformat': errorformat }
endfunction

