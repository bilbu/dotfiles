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
set ai
set smartindent
set smarttab
set bs=2
" set encoding=iso-8859-15
set enc=utf-8
set nu
" set nowrap
colorscheme torte
set laststatus=2
set vb t_vb=
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


" modeline into a file) (override default value of 5)
set modelines=0

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
"set nocompatible       " Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start  " more powerful backspacing

" Now we set some defaults for the editor
set autoindent         " always set autoindenting on
set textwidth=0         " Don't wrap words by default
set nobackup            " Don't keep a backup file
set viminfo='20,\"50    " read/write a .viminfo file, don't store more than
                        " 50 lines of registers
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc


" We know xterm-debian is a color terminal
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=32
  set t_Sf=
  set t_Sb=

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" Debian uses compressed helpfiles. We must inform vim that the main
" helpfiles is compressed. Other helpfiles are stated in the tags-file.
set helpfile=$VIMRUNTIME/doc/help.txt.gz

if has("autocmd")
 " Enabled file type detection
 " Use the default filetype settings. If you also want to load indent files
 " to automatically do language-dependent indenting add 'indent' as well.
 filetype plugin on

endif " has ("autocmd")

" Some Debian-specific things
augroup filetype
  au BufRead reportbug.*                set ft=mail
  au BufRead reportbug-*                set ft=mail
augroup END

" The following are commented out as they cause vim to behave a lot
" different from regular vi. They are highly recommended though.
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
"set incsearch          " Incremental search
"set autowrite          " Automatically save before commands like :next and :make

endif " if &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
set paste
