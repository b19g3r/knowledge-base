set shell=/bin/bash
" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'tomasr/molokai'
"Plugin 'vim-scripts/phd'
"Plugin 'Lokaltog/vim-powerline'
"Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'derekwyatt/vim-fswitch'
"Plugin 'kshenoy/vim-signature'
"Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
"Plugin 'majutsushi/tagbar'
"Plugin 'vim-scripts/indexer.tar.gz'
"Plugin 'vim-scripts/DfrankUtil'
"Plugin 'vim-scripts/vimprj'
"Plugin 'dyng/ctrlsf.vim'
"Plugin 'terryma/vim-multiple-cursors'
"Plugin 'scrooloose/nerdcommenter'
"Plugin 'vim-scripts/DrawIt'
"Plugin 'SirVer/ultisnips'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'derekwyatt/vim-protodef'
"Plugin 'scrooloose/nerdtree'
"Plugin 'fholgado/minibufexpl.vim'
"Plugin 'gcmt/wildfire.vim'
"Plugin 'sjl/gundo.vim'
"Plugin 'Lokaltog/vim-easymotion'
Plugin 'suan/vim-instant-markdown'
"Plugin 'lilydjwg/fcitx.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"插件列表结束
call vundle#end()
filetype plugin indent on

"theme
"set background=dark
"colorscheme solarized
"设置状态栏主题风格
"let g:Powerline_colorscheme='solarized256'
let g:airline_solarized_bg='dark'
"let g:airline_theme='solarized dark'

"总是显示状态栏
set laststatus=2
"显示光标当前位置
set ruler
"开启行号显示
set number
"高亮显示当前行/列
set cursorline
"set cursorcolumn
"display command
set showcmd
"searching immediatly
set incsearch
"
set mouse=a
set mouse=v

autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
set encoding=utf8


se so=7

"高亮显示搜索结果
set hlsearch
"禁止折行
set nowrap
"开启语法高亮功能
syntax enable
"允许用指定语法高亮配色方案替换默认方案
syntax on

"自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4


