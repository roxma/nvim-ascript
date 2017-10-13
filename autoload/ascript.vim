if !has('nvim')
    finish
endif

if get(g:, 'ascript#loaded', 0)
    finish
endif
let ascript#loaded = 1

let s:ruby_init = 0

func! ascript#py_call(fn, ...)
python << EOF
import vim
def handler(fn, *args):
    eval(fn)(*args)
fn, args = vim.eval('[a:fn, a:000]')
vim.async_call(handler, fn, *args)
EOF
endfunc

func! ascript#python_call(...)
    call call('ascript#py_call', a:000)
endfunc

func! ascript#py3_call(fn, ...)
python3 << EOF
import vim
def handler(fn, *args):
    eval(fn)(*args)
fn, args = vim.eval('[a:fn, a:000]')
vim.async_call(handler, fn, *args)
EOF
endfunc

func! ascript#python3_call(...)
    call call('ascript#py3_call', a:000)
endfunc

func! ascript#py(script)
python << EOF
import vim
def handler(script):
    exec(script)
script = vim.eval('a:script')
vim.async_call(handler, script)
EOF
endfunc

func! ascript#python(...)
    call call('ascript#py', a:000)
endfunc

func! ascript#py3(script)
python3 << EOF
import vim
def handler(script):
    exec(script)
script = vim.eval('a:script')
vim.async_call(handler, script)
EOF
endfunc

func! ascript#python3(...)
    call call('ascript#py3', a:000)
endfunc

func! ascript#ruby(script)
    if !s:ruby_init
        ruby 1
        let s:ruby_init = 1
    endif
    let s:host = remote#host#Require('legacy-ruby-provider')
    call rpcnotify(s:host, 'ruby_execute', a:script, line('.'), line('.'))
endfunc

