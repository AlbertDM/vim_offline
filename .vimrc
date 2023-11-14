" VIM_CLEAN
" https://github.com/AlbertDM/vim_clean/
"
" VIM_COMMANDS:
"
""" :e  To navigate through system directories and files
""" <ctrl> + N  To autocomplete list
""" %s/<keyword>/<replace_with>/g

" Abbreviations
abbr W w
abbr Q q
abbr Wq wq
abbr wQ wq
abbr WQ wq
abbr w1 w!

" Set line numbers
set number

" Highlight current line
set cursorline

" Enable syntax highlighting
syntax enable

" Auto-indentation and smart indenting
set autoindent
set smartindent

" Expand tabs to spaces
set expandtab
set tabstop=4
set shiftwidth=4

" Show matching parentheses/brackets
set showmatch

" Enable line wrapping
set wrap

" Save file and retain current position
nnoremap <leader>w :update<CR>

" Save all open files
nnoremap <leader>W :wa<CR>

" Display line and column numbers in status line
set ruler

" Enable incremental search
set incsearch

" Highlight search matches as you type
set hlsearch

" Enable mouse support
set mouse=a

" Set clipboard to use system clipboard
set clipboard=unnamedplus

" Enable undo and redo with Ctrl+Z and Ctrl+Shift+Z
nnoremap <C-z> u
nnoremap <C-S-z> <C-R>

" C file specific settings
autocmd FileType c setlocal omnifunc=ccomplete#Complete
autocmd FileType c setlocal textwidth=100

" Markdown and AsciiDoc file specific settings
autocmd FileType markdown,asciidoc setlocal textwidth=100

" Python files
autocmd FileType python setlocal textwidth=100

" Map F5 to compile and run the current C file
nnoremap <F5> :!gcc % -o %< && ./%<<CR>

" Map F6 to clear the terminal
nnoremap <F6> :!clear<CR>

" Map F8 to open a terminal
nnoremap <F8> :below 10sp term://bash<CR>

" Set leader key to comma
let mapleader = ","

" Configure status line
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Display a message when leaving insert mode
let &t_SI = "\<Esc>[1 q"
let &t_EI = "\<Esc>[5 q"

" Enable line and column numbers in command mode
set showcmd

" Enable autocompletion using Tab
set wildmenu
set wildmode=list:longest,full

" Highlight the current line only in the current window
set cursorline

" Save undo history
set undofile

" Enable auto-save backup files
set backup
set backupdir=~/.vim/backup
set backupext=.bak

" Enable persistent undo history
set undodir=~/.vim/undo

" Highlight search results while typing
set incsearch

" Enable case-insensitive searching
set ignorecase
set smartcase

" Enable line folding
set foldmethod=indent
set foldlevel=99

" Enable auto-close for parentheses, brackets, etc.
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>

" Enable tagbar for a visual representation of tags
" nnoremap <F9> :TagbarToggle<CR>

" Enable NERDTree for file navigation
" nnoremap <F7> :NERDTreeToggle<CR>

" Enable color scheme (adjust as needed)
colorscheme desert

" Automatically update the file if changed externally
set autoread

" Enable smooth scrolling
set scrolloff=5
set sidescrolloff=5

" Autoremove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e
" If extra whitespace : Red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/ containedin=ALL

" Enable line numbers for normal mode and relative numbers for insert mode
" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"   autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
" augroup END



" FEATURES:
" Spelling words
" Automatically fix the last misspelled word and jump back to where you were.
" " Taken from this talk: https://www.youtube.com/watch?v=lwD8G1P52Sk
" " zg )Zink Good): Place the cursor on a word to remove red background
nnoremap <leader>sp :normal! mz[s1z=`z<CR>
" set spell
" TODO: FIX IT!
" function! ZgAllMisspelledWords()
"     normal gg
"     while !eof()
"         b_misspelled = execute "normal ]s"
"         if b_misspelled
"             exe 'normal zg'
" endfunction
" autocmd BufReadPre * : call ZgAllMisspelledWords()