" Example Vim graphical configuration.
" Copy to ~/.gvimrc or ~/_gvimrc.

set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
set antialias                     " MacVim: smooth fonts.
set guioptions-=T                 " Hide toolbar.
set lines=50 columns=200          " Window dimensions.

" set guioptions-=r                 " Don't show right scrollbar

" Command-Option-ArrowKey to switch viewports
map <D-M-Up> <C-w>k
imap <D-M-Up> <Esc> <C-w>k
map <D-M-Down> <C-w>j
imap <D-M-Down> <Esc> <C-w>j
map <D-M-Right> <C-w>l
imap <D-M-Right> <Esc> <C-w>l
map <D-M-Left> <C-w>h
imap <D-M-Left> <C-w>h

" Adjust viewports to the same size
map <Leader>= <C-w>=
imap <Leader>= <Esc> <C-w>=

if has("gui_macvim")
  " Powerline - requires customized fonts package.  See fontpatcher readme in
  " bundle/powerliner/fontpatcher.
  let g:Powerline_symbols = 'fancy'

  macmenu &File.New\ Tab key=<nop>
  macmenu &File.Close key=<nop>
  macmenu Window.Select\ Next\ Tab key=<nop>
  macmenu Window.Select\ Previous\ Tab key=<nop>

  map <D-t> :CtrlP<CR>
  map <D-r> :CtrlPBuffer<CR>
  map <D-e> :CtrlPMRUFiles<CR>
  map <D-{> :BB<CR>
  map <D-}> :BF<CR>
  map <D-w> :BD<CR>
endif


