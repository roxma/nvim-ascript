if !has('nvim')
    finish
endif

if get(g:, 'ascript#loaded', 0)
    finish
endif
let ascript#loaded = 1

let s:python_init = 0
let s:python3_init = 0
let s:ruby_init = 0

func! ascript#python(script)
    if !s:python_init
        python pass
        let s:python_init = 1
    endif
    let s:host = remote#host#Require('legacy-python-provider')
    call rpcnotify(s:host, 'python_execute_async', a:script, line('.'), line('.'))
endfunc

func! ascript#python3(script)
    if !s:python3_init
        python3 pass
        let s:python3_init = 1
    endif
    let s:host = remote#host#Require('legacy-python3-provider')
    call rpcnotify(s:host, 'python_execute_async', a:script, line('.'), line('.'))
endfunc

func! ascript#ruby(script)
    if !s:ruby_init
        ruby 1
        let s:ruby_init = 1
    endif
    let s:host = remote#host#Require('legacy-ruby-provider')
    call rpcnotify(s:host, 'ruby_execute', a:script, line('.'), line('.'))
endfunc

