" Functions
function! phpfunctions#runPhpUnitTestAllFile()
  let phpUnitPath = '/Users/namtx/Projects/personio/personio/vendor/phpunit/phpunit/phpunit'
  execute(':tab term '.phpUnitPath.' '.expand('%:p').' --stop-on-failure')
endfunction

function! phpfunctions#runPhpUnitTestOnlyFunction()
  let phpUnitPath = '/Users/namtx/Projects/personio/personio/vendor/phpunit/phpunit/phpunit'
  normal [[2w
  " public function test()
  execute(':tab term '.phpUnitPath.' '.expand('%:p').' --filter '.expand('<cword>').' --stop-on-failure')
endfunction
