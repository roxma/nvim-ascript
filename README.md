# NVIM-ASCRIPT

Run async python script easily without using neovim's rplugin or job feature
explicitly.

## Motivation

To be honest, I don't like neovim's `UpdateRemotePlugins`, and sometims I just
want a small fragment of python/ruby code to be run async.

## Installation

Assuming you're using [vim-plug](https://github.com/junegunn/vim-plug)

```
Plug 'roxma/nvim-ascript'
```

## Usage

```vim
python3 << EOF
def greet(name):
    import vim
    from time import time
    t = time()
    # delay for about 3s
    while t + 3 >= time():
        pass
    vim.command("echo 'hi %s'" % name)
EOF

call ascript#py3_call('greet', 'roxma')
```

A list of methods:

- `ascript#py3_call(fn, ...)`
- `ascript#py_call(fn, ...)`
- `ascript#py3(script)`
- `ascript#py(script)`
- `ascript#ruby(script)`

