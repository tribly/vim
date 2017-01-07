" Detect syntax file.
autocmd BufNewFile,BufRead *.snip,*.snippets set filetype=neosnippet
" recognize .snippet files
if has("autocmd")
    autocmd BufNewFile,BufRead *.snippets setf snippets
endif
