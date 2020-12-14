
set number
syntax on
set tabstop=2
set shiftwidth=2
set expandtab
let mapleader=","
map <leader>def <c-]><cr>
set splitbelow
set termwinsize=10x0

filetype plugin on
filetype indent on
au BufEnter *.tex set autowrite
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
let g:Tex_GotoError = 0
let g:Tex_ViewRule_pdf = 'evince'

set makeprg=make\ -j9
nnoremap <F7> :make!<cr>
nnoremap <F5> :!./main<cr>
map <C-n> :NERDTreeToggle<CR>
