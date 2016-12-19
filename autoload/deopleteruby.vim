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
  let source_files = [
        \ 'autoload/deoplete-ruby/sources/core_methods',
        \ 'autoload/deoplete-ruby/sources/keywords',
        \ ]

  for source_file in source_files
    let meths = readfile(globpath(&rtp, source_file))

    for meth in meths
      let cache = {}
      let cache.word = split(meth)[0]
      let cache.kind = split(meth)[1]
      call add(g:deopleteruby#words_cache, cache)
    endfor
  endfor
endfunction
