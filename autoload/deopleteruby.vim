function! deopleteruby#gather_candidates(input, position, filetype)
  if !exists("g:deopleteruby#words_cache")
    call deopleteruby#build_cache(a:filetype)
    " echohl ErrorMsg | echomsg 'no cache' | echohl None
    return g:deopleteruby#words_cache
  else
    " echohl ErrorMsg | echomsg 'from cache' | echohl None
    return g:deopleteruby#words_cache
  endif
endfunction

function! deopleteruby#build_cache(filetype)
  if a:filetype == 'ruby'
    let main_dict = readfile(globpath(&rtp,
                             \ 'autoload/deoplete-ruby/sources/main.dict'))
    let string_dict = readfile(globpath(&rtp,
                             \ 'autoload/deoplete-ruby/sources/string.dict'))

    let words_cache = []
    for meth in string_dict
      let cache = {}
      let cache.word = split(meth)[0]
      let cache.kind = split(meth)[1]
      call add(words_cache, cache)
    endfor
    let g:deopleteruby#words_cache = words_cache
  else
    return
  endif
endfunction
