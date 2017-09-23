set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" plugins
" ...
" 自动缩进
Plugin 'vim-scripts/indentpython.vim'
" 自动补全
Bundle 'Valloric/YouCompleteMe'
" 检查代码的语法
Plugin 'scrooloose/syntastic'
" 风格检查
Plugin 'nvie/vim-flake8'
" 配色方案
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
" 文件浏览
Plugin 'scrooloose/nerdtree'
"F2开启和关闭树"
map <F2> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
" Plugin 'jistr/vim-nerdtree-tabs'
" 超级搜索
Plugin 'kien/ctrlp.vim'
" Git集成
Plugin 'tpope/vim-fugitive'
" Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
set laststatus=2
set t_Co=256
" ...
Plugin 'Yggdroot/indentLine'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tell-k/vim-autopep8'
Plugin 'scrooloose/nerdcommenter'



"
" start costomize vimrc
"
set softtabstop=4 tabstop=4 shiftwidth=4 expandtab fileformat=unix encoding=utf-8

" au[tocmd]
" ...
" py, go, c, cpp file
au BufNewFile,BufRead *.py,*go,*c,*cpp
            \ set textwidth=79
            \ autoindent
            \ number

" js, html, css file
au BufNewFile,BufRead *.js,*.html,*.css
            \ set ts=2 sts=2 sw=2
            \ textwidth=79
            \ autoindent
            \ number

let python_highlight_all=1
syntax on

"按F5运行python"
map <F5> :Autopep8<CR> :w<CR> :call RunPython()<CR>
function RunPython()
  let mp = &makeprg
  let ef = &errorformat
  let exeFile = expand("%:t")
  setlocal makeprg=python\ -u
  set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
  silent make %
  copen
  let &makeprg = mp
  let &errorformat = ef
endfunction

" 加头copyright信息
au BufNewFile *.[ch] 0read ~/git/gxy/rdc/copyright/copyright.c | $
au BufNewFile *.php 0read ~/git/gxy/rdc/copyright/copyright.php | $
au BufNewFile *.py 0read ~/git/gxy/rdc/copyright/copyright.py | $
au BufNewFile *.go 0read ~/git/gxy/rdc/copyright/copyright.go | $
