" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.
syntax enable                     " Turn on syntax highlighting.
set encoding=utf-8

call pathogen#infect()
filetype plugin indent on         " Turn on file type detection.
runtime macros/matchit.vim        " Load the matchit plugin.

" VISUAL
colorscheme twilight
set number                        " Show line numbers.
set ruler                         " Show cursor position.
set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set nowrap                        " Turn off line wrapping in intelligent side scrolling
set sidescroll=5
set listchars+=precedes:<,extends:>
set scrolloff=3                   " Show 3 lines of context around the cursor.
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set title                         " Set the terminal's title
set visualbell                    " No beeping.

set laststatus=2                  " Show the status line all the time
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=80
endfunction

if has("autocmd")
  " In Makefiles, use real tabs, not tabs expanded to spaces
  au FileType make set noexpandtab

  " Make sure all markdown files have the correct filetype set and setup wrapping
  " au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()

  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json set ft=javascript

  " JST files should use mustache
  " au BufNewFile,BufRead *.jst set ft=mustache

  " make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
  au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
endif

" BEHAVIOR
set backspace=indent,eol,start    " Intuitive backspacing.
set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set backupdir=~/.vim/_backup      " where to put backup files.
set directory=~/.vim/_temp        " where to put swap files.

" ignore Rubinius, Sass cache files
set wildignore+=tmp/**,*.rbc,.rbx,*.scssc,*.sassc,*.as,vendor/**,projects/digital_invitation_studio/**,*.png,*.jpg,*.jpeg,*.gif,*.ico,*.swf

" KEYBINDINGS / COMMANDS

" Close a buffer without closing the window
" nmap <leader>d :bprevious<CR>:bdelete #<CR>

" Emacs-ish bindings to split windows
nmap <C-X>2 :split<CR>
nmap <C-X>3 :vsplit<CR>

" Tags
" map <Leader>rt :!ctags -R --exclude=.git --exclude=log --exclude=projects --exclude=flex --exclude=public --exclude=vendor *<CR><CR>

command! KillWhitespace :normal :%s/ *$//g<cr><c-o><cr>

" disable cursor keys in normal mode
" map <Left>  :echo "no!"<cr>
" map <Right> :echo "no!"<cr>
" map <Up>    :echo "no!"<cr>
" map <Down>  :echo "no!"<cr>

" Command-T
let g:CommandTMaxHeight=20
