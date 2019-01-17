call deoplete#custom#source('LanguageClient',
            \ 'min_pattern_length',
            \ 2)

let g:LanguageClient_serverCommands = {
  \ 'cpp': ['clangd'],
  \ 'java': ['/usr/local/bin/jdtls'],
  \ 'dockerfile': [&shell, &shellcmdflag, 'docker-langserver --stdio'],
  \ 'python': ['pyls'],
  \ }

