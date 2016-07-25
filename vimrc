execute pathogen#infect()
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
set clipboard=unnamedplus
set clipboard=unnamed
call vundle#begin()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set mouse=a
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set timeoutlen=1000 ttimeoutlen=0

" Set Ack 
let g:ackprg = 'ag --nogroup --nocolor --column'

" function to toggle relativenumbers
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber 
    else
        set relativenumber
    endif
endfunc

" Map escape to jj 
:imap jj <Esc>

set laststatus=2
" Leader key mappings
let mapleader = "\<Space>"
nnoremap <leader>n :call NumberToggle()<CR>

" Set syntastic Settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers          = ['rubocop', 'mri']
let g:syntastic_ruby_rubocop_exec      = '/Users/jhamilton/.rbenv/shims/rubocop'

" Set ignored files for ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|bower_components\|git'
map ,b :CtrlPBuffer<CR>

" Set autotag file for ctags
let g:autotagTagsFile="./tags"


" Plugins to Install
Plugin 'burnettk/vim-angular'
Plugin 'pangloss/vim-javascript'
Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'airblade/vim-gitgutter'
Plugin 'Yggdroot/indentLine'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'elixir-lang/vim-elixir'
Plugin 'L9'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-unimpaired'
Plugin 'ervandew/supertab'
Plugin 'mattn/emmet-vim'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-endwise'
Plugin 'mileszs/ack.vim'
Plugin 'craigemery/vim-autotag'
Plugin 'hwartig/vim-seeing-is-believing'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'tmhedberg/matchit'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'rakr/vim-one'
Bundle 'edkolev/tmuxline.vim'

call vundle#end()          
filetype plugin indent on  

" Set Line Numbers to On
set number

:runtime macros/matchit.vim 

" Set Color Scheme and set Syntax to On
colorscheme one
set background=dark
let g:airline_theme='one'
let g:airline_powerline_fonts = 1
syntax on
hi Pmenu cterm=none ctermfg=Blue ctermbg=Black

if (empty($TMUX))
      if (has("nvim"))
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
      endif
      if (has("termguicolors"))
        set termguicolors
      endif
endif

" NERDTree Settings
let NERDTreeMinimalUI = 1

map <C-n> :NERDTreeToggle<CR>

:nmap <C-s> :w<CR>
:imap <C-s> <Esc>:w<CR>a

" Enable seeing-is-believing mappings only for Ruby
augroup seeingIsBelievingSettings
    autocmd!

    autocmd FileType ruby nmap <buffer> <Enter> <Plug>(seeing-is-believing-mark-and-run)
    autocmd FileType ruby xmap <buffer> <Enter> <Plug>(seeing-is-believing-mark-and-run)

    autocmd FileType ruby nmap <buffer> <leader>t <Plug>(seeing-is-believing-mark)
    autocmd FileType ruby xmap <buffer> <leader>t <Plug>(seeing-is-believing-mark)
    autocmd FileType ruby imap <buffer> <leader>t <Plug>(seeing-is-believing-mark)

    autocmd FileType ruby nmap <buffer> <leader>r <Plug>(seeing-is-believing-run)
    autocmd FileType ruby imap <buffer> <leader>r <Plug>(seeing-is-believing-run)
augroup END

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

