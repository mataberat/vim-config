  set backupdir=/tmp//
  set directory=/tmp//
  set undodir=/tmp//
  set cursorline
  set ruler
  set shiftwidth=4
  set tabstop=2
  set backspace=2
  set undofile

" required for several plugins
  set nocompatible

" enable syntax highlighting
  syntax on

" default color scheme
  set t_Co=256
  colorscheme snazzy
"  set background=dark

" don't wrap long lines
  set nowrap

" show commands as we type them
  set showcmd

" highlight matching brackets
  set showmatch

" scroll the window when we get near the edge
  set scrolloff=4 sidescrolloff=10

" use 2 spaces for tabs
  set expandtab tabstop=2 softtabstop=2 shiftwidth=2
  set smarttab

" enable line numbers, and don't make them any wider than necessary
  set number numberwidth=2

" show the first match as search strings are typed
  set incsearch

" highlight the search matches
  set hlsearch

" highlight cursor line
  set cursorline

" searching is case insensitive when all lowercase
  set ignorecase smartcase

" assume the /g flag on substitutions to replace all matches in a line
  set gdefault

" set temporary directory (don't litter local dir with swp/tmp files)
  set directory=/tmp/

" pick up external file modifications
  set autoread

" don't abandon buffers when unloading
  set hidden

" match indentation of previous line
  set autoindent

" perform autoindenting based on filetype plugin
  filetype plugin indent on

" don't blink the cursor
  set guicursor=a:blinkon0

" show current line info (current/total)
  set ruler rulerformat=%=%l/%L

" show status line
  set laststatus=2

" augment status line
  function! ETry(function, ...)
    if exists('*'.a:function)
      return call(a:function, a:000)
    else
      return ''
    endif
  endfunction
  set statusline=[%n]\ %<%.99f\ %h%w%m%r%{ETry('CapsLockStatusline')}%y%{ETry('rails#statusline')}%{ETry('fugitive#statusline')}%#ErrorMsg#%*%=%-16(\ %l,%c-%v\ %)%P

" When lines are cropped at the screen bottom, show as much as possible
  set display=lastline

" flip the default split directions to sane ones
  set splitright
  set splitbelow

" don't beep for errors
  set visualbell

" make backspace work in insert mode
  set backspace=indent,eol,start

" highlight trailing whitespace
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  set list

" have the mouse enabled all the time
  set mouse=a

" use tab-complete to see a list of possiblities when entering commands
  set wildmode=list:longest,full

" allow lots of tabs
  set tabpagemax=20

" remember last position in file
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" Thorfile, Rakefile, Vagrantfile, and Gemfile are Ruby
  au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" JSON is JS
  au BufNewFile,BufRead *.json set ai filetype=javascript

" *.hh is hack file (php)
  au BufRead,BufNewFile *.hh set filetype=php

" *.es6 is javascript file
  au BufRead,BufNewFile *.es6 set filetype=javascript

  let NERDTreeShowHidden=1

" Enable RustFmt when saving
  let g:rustfmt_autosave = 1

" Syntastic config
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_error_symbol = "✗"
  let g:syntastic_warning_symbol = "⚠"
