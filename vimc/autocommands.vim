augroup glsl_files
  autocmd!
  autocmd BufRead,BufNewFile *.vs set filetype=glsl
  autocmd BufRead,BufNewFile *.gs set filetype=glsl
  autocmd BufRead,BufNewFile *.fs set filetype=glsl
  autocmd BufRead,BufNewFile *.vert set filetype=glsl
  autocmd BufRead,BufNewFile *.frag set filetype=glsl
augroup END

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
