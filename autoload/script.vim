
let g:script#tmp = ""

func! script#pycall(fn, ...)
    let s:tmp = ""
python << EOF
import vim
fn, args = vim.eval('[a:fn, a:000]')
ret = eval(fn)(*args)
vim.vars['script#tmp'] = ret
EOF
    return g:script#tmp
endfunc

func! script#python_call(...)
    return call('script#pycall', a:000)
endfunc

func! script#py3call(fn, ...)
    let s:tmp = ""
python3 << EOF
import vim
fn, args = vim.eval('[a:fn, a:000]')
ret = eval(fn)(*args)
vim.vars['script#tmp'] = ret
EOF
    return g:script#tmp
endfunc

func! script#python3_call(...)
    return call('script#py3call', a:000)
endfunc

