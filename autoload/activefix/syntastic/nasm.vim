" this file is based on syntastic/syntax_checkers/nasm.vim
"============================================================================
"File:        nasm.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Håvard Pettersson <haavard.pettersson at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

"bail if the user doesnt have nasm installed
if !executable("nasm")
    finish
endif

function! activefix#syntastic#nasm#config()
    if has("win32")
        let outfile="NUL"
    else
        let outfile="/dev/null"
    endif
    let wd = shellescape(activefix#syntastic#expand_target('nasm', "%:p:h") . "/")
    let makeprg = "nasm -X gnu -f elf -I " . wd . " -o " . outfile . " " . shellescape(activefix#syntastic#expand_target('nasm', "%"))
    let errorformat = '%f:%l: %t%*[^:]: %m'
    return { 'makeprg': makeprg, 'errorformat': errorformat }
endfunction
