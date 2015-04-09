" Vim header for development files
" " HEADER "
"
" File Name         : header.vim
" Created By        : Thomas Aurel
" Creation Date     : November 5th, 2014
" Version           : 0.4
" Last Change       : April  9th, 2015 at 16:41:45
" Last Changed By   : Unknow Maintainer
"
function! s:Find(list, element)
    let value = 0
    for e in a:list
        if e ==# a:element
            let value = 1
        endif
    endfor
    return value
endfunction

function! s:header_creation_check()
    " let g:header_command = "wc -l <"
    let s:date = strftime("%B %eth, %Y")
    let s:date_modif = s:date . strftime(" at %X")
    let s:filename = expand("%")
    let s:header_size = 10

    if !exists("g:header_author")
        let g:header_author = "Unknown Author"
    endif
    if !exists("g:header_docker_maintainer")
        let g:header_docker_maintainer = "Unknow Maintainer"
    endif
    if !exists("g:header_docker_base")
        let g:header_docker_base = "centos:centos7"
    endif
    if !exists("g:header_types")
        let g:header_types = ['awk', 'c', 'cpp', 'dockerfile', 'lex', 'make', 'pentadactyl', 'python', 'sh', 'vim', 'yacc']
    endif

    if s:Find(g:header_types, &filetype) == 0
        return
    endif

    if !exists("g:header_file")
        let g:header_file = globpath(&runtimepath, 'plugin/headers/' . &filetype . '.header')
    endif

    if exists("b:creation")
        if b:creation
            execute "source" . g:header_file
            if (&filetype !=# 'dockerfile')
                execute "1," . s:header_size . "g/File Name.*:.*/s//File Name         : ". s:filename
                execute "1," . s:header_size . "g/Created By.*:.*/s//Created By        : ". g:header_docker_maintainer
                execute "1," . s:header_size . "g/Creation Date.*:.*/s//Creation Date     : ". s:date
            else
                execute "1," . s:header_size . "g/from.*/s//from " . g:header_docker_base
                execute "1," . s:header_size . "g/maintainer.*/s//maintainer " . g:header_docker_maintainer
            endif
        endif
    endif

    let b:creation = 0
    augroup header_modification
        autocmd!
        autocmd BufWritePre,FileWritePre * execute "normal ma"
        autocmd BufWritePre,FileWritePre * execute "1," . s:header_size . "g/Last Change .*:.*/s//Last Change       : " . s:date_modif
        autocmd BufWritePre,FileWritePre * execute "1," . s:header_size . "g/Last Changed By.*:.*/s//Last Changed By   : " . g:header_author
        autocmd BufWritePre,FileWritePre * execute "normal `a""`"
    augroup END
endfunction

if !exists("g:header_active")
    let g:header_active = 1
endif

if g:header_active
    " echom "Header plugin is active"
    autocmd BufNewFile * :let b:creation = 1
    autocmd BufNewFile,FileType <buffer> call s:header_creation_check()
endif
