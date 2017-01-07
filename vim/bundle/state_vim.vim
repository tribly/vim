if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/heinz/.vimrc'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/heinz/.vim/bundle'
let g:dein#_runtime_path = '/home/heinz/.vim/bundle/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/home/heinz/.vim/bundle/.cache/.vimrc'
let &runtimepath = '/home/heinz/.vim,/home/heinz/.vim/bundle/repos/github.com/Shougo/dein.vim,/home/heinz/.vim/bundle/.cache/.vimrc/.dein,/usr/share/vim/vimfiles,/usr/share/vim/vim80,/usr/share/vim/vimfiles/after,/home/heinz/.vim/after,/home/heinz/.vim/bundle/.cache/.vimrc/.dein/after'
