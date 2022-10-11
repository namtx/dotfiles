function! jestfunctions#testAll()
  execute(':tab term yarn test '.expand('%:p'))
endfunction

function! jestfunctions#testOne()
  let testPattern = matchstr(getline('.'), 'it(\zs.*\ze,')
  execute(':tab term yarn test '.expand('%:p').' -t '.testPattern)
endfunction

