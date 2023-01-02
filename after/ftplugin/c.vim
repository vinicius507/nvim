if &filetype == "c" || (&filetype == "cpp" && expand('%:e') == "h")
  setlocal colorcolumn=80
  setlocal tabstop=4
  setlocal shiftwidth=4
  setlocal noexpandtab
endif
