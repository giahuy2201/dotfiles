syntax on " enable syntax highlighting

" EDITING

"set number relativenumber
set cursorline " highlight current line
set hlsearch " highlighted search results
set showcmd " show selection metadata
set showmode " show INSERT, VISUAL, etc. mode
set showmatch " show matching brackets

" TAB & INDENTING

set autoindent smartindent " auto/smart indent
set expandtab " spaces instead of tabs
set tabstop=2 " 2 spaces for tabs
set scrolloff=6 " show at least 6 lines above/below
set clipboard=unnamed " allow yy, etc. to interact with OS X clipboard

filetype on
filetype indent on " enable filetype-specific indenting
