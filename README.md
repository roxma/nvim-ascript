# NVIM-ASCRIPT

Run async python script easily without using neovim's rplugin or job feature
explicitly.

## Requirements

As a proof of concept, currently this plugin requires a modified version of
neovim python client:

```
git clone https://github.com/roxma/python-client.git
cd python-client
pip uninstall neovim
pip install --user -e .
```

## Installation

Assuming you're using [vim-plug](https://github.com/junegunn/vim-plug)

```
Plug 'roxma/nvim-ascript'
```

## Usage

```vim
call ascript#python3("import vim")
call ascript#python3("vim.command('echo &rtp')")
" add a delay
call ascript#python3("for i in range(100000000):\n  pass\nvim.command('echo &rtp')")
```

