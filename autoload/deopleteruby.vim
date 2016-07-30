let g:deopleteruby#words_cache = []

function! deopleteruby#gather_candidates(input, position, filetype)
  if !len(g:deopleteruby#words_cache)
    " echohl ErrorMsg | echomsg 'no cache' | echohl None
    call deopleteruby#build_cache()
    return g:deopleteruby#words_cache
  else
    " echohl ErrorMsg | echomsg 'cache' | echohl None
    return g:deopleteruby#words_cache
  endif
endfunction

function! deopleteruby#build_cache()
  let core_lib = readfile(globpath(&rtp, 'autoload/deoplete-ruby/sources/core_methods'))

  let words_cache = []
  for meth in core_lib
    let cache = {}
    let cache.word = split(meth)[0]
    if len(split(meth)) > 1
      let cache.kind = split(meth)[1]
    endif
    call add(words_cache, cache)
  endfor
  let g:deopleteruby#words_cache = words_cache
endfunction
