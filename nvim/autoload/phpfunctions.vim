" Functions
function! s:getPhpUnitCommand()
  let webPod = system('kubectl get pods -l app.kubernetes.io/name=web -o jsonpath={".items[0].metadata.name"}')

  return 'kubectl exec -it '.webPod.' -- vendor/phpunit/phpunit/phpunit'
endfunction

function! s:getFilePath()
  return substitute(expand('%:p'), getcwd().'/', '', '')
endfunction

function! phpfunctions#runPhpUnitTestAllFile()
  execute(':tab term '.s:getPhpUnitCommand().' '.s:getFilePath().' --stop-on-failure')
endfunction

function! phpfunctions#runPhpUnitTestOnlyFunction()
  normal [[2w

  execute(':tab term '.s:getPhpUnitCommand().' '.s:getFilePath().' --filter '.expand('<cword>').' --stop-on-failure')
endfunction
