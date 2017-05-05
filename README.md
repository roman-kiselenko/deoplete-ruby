## Deoplete-Ruby Completion ##
Just a source for [Deoplete](https://github.com/Shougo/deoplete.nvim)
provide the core Ruby methods, super simple and use a text file as source

This is the working version.

```
# Developed and tested on:
NVIM 0.1.4 (not tested on VIM!)
```

Here is [deoplete with rcodetools](https://github.com/Shougo/deoplete-rct)

## Getting started

Add to [Plug](https://github.com/junegunn/vim-plug) package manager or any other:

```vim
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'fishbullet/deoplete-ruby'

call plug#end()
```

## Contributing

Feel free to send a pull request :stuck_out_tongue_closed_eyes:!

## TODO

* Add more completion sources
* Completes for omni candidates
* ... :ok_hand: ...




