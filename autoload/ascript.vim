
func! ascript#python(script)
  let s:host = remote#host#Require('legacy-python-provider')
  call rpcnotify(s:host, 'python_execute_async', a:script, line('.'), line('.'))
endfunc

func! ascript#python3(script)
  let s:host = remote#host#Require('legacy-python3-provider')
  call rpcnotify(s:host, 'python_execute_async', a:script, line('.'), line('.'))
endfunc

