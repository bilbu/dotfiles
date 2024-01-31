set notitle
set nocompatible
set hlsearch            " Switch on syntax highlighting.
set incsearch           " show matches on the fly
syn on
set magic
autocmd FileType c,cpp,slang set cindent
autocmd FileType c set formatoptions+=ro
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set smartindent
set smarttab
"set backspace=2
" set encoding=iso-8859-15
set encoding=utf-8
set number
set nowrap

" Set theme and background transparency
colorscheme torte
highlight Normal ctermbg=none
highlight NonText ctermbg=none

set laststatus=2
set visualbell t_vb=
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set showmode
set showcmd
set ttyfast
"set mouse=a
" Newer vims let you paste without holding shift, so let's make this a default
if version>=508
   set mouse=v         " Use mouse to select and point in visual mode
                       " for all use mouse=a
                       " (use shift+click to  get old cut/paste behavior)
endif

set fileformats=unix   " I want to see those ^M if I'm editing a dos file.
                       " See below (Key Mappings) for ^M removal!
" Removes those bloody ^M's
fun RmCR()
    let oldLine=line('.')
    exe ":%s/\r//g"
    exe ':' . oldLine
endfun
map <F5> :call RmCR()<CR>

set pastetoggle=<F2>

" modeline into a file) (override default value of 5)
set modelines=0

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
"set nocompatible       " Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start  " more powerful backspacing

" Now we set some defaults for the editor
set autoindent          " always set autoindenting on
set textwidth=0         " Don't wrap words by default
set nobackup            " Don't keep a backup file
set viminfo='20,\"50    " read/write a .viminfo file, don't store more than
                        " 50 lines of registers
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

set cursorline
set cursorcolumn
