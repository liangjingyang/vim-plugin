"Set mapleader
let mapleader = ","
let g:mapleader = ","

set nu
set expandtab
set tabstop=4
set shiftwidth=4
set hlsearch
set nrformats=

au FileType ruby set softtabstop=2 | set shiftwidth=2

"Get out of VI's compatible mode..
set nocompatible

"Sets how many lines of history VIM har to remember
set history=400

"Enable filetype plugin
filetype plugin on
filetype indent on

"set list                       " 显示制表符
"set listchars = tab:>-,trail:- " 将制表符显示为'>---',将行尾空格显示为'-'
"set listchars=tab:.\ ,trail:.   " 将制表符显示为'.   '

"open this setting will make ctags error
"set autochdir                   " 自动设置目录为正在编辑的文件所在的目录


" 设置字体

"set guifont=Bitstream\ Vera\ Sans\ consolas:h12
"set guifont=consolas:h12
"set guifont=Monaco:h12

"Set to auto read when a file is changed from the outside
set autoread

"Have the mouse enabled all the time. close because crt can't use mouse
"set mouse=a


nmap <leader>w :w!<cr>
"Fast copy 
nmap <leader>y "+y<cr>
"Fast copy 
map <leader>y "+y<cr>
"Fast reloading of the .vimrc
map <leader>s :source ~/.vimrc<cr>
"Fast Quit
map <leader>q :q<cr>
"Undolist 
map <leader>u :undolist<cr>
"Fast editing of .vimrc
map <leader>e :e ~/.buffer<cr>
"Remap VIM 0
map 0 ^
"Switch to current dir
map <leader>cd :cd %:p:h<cr>
inoremap ;; <Esc>
nmap :X :x
nmap :W :w
nmap :Q :q

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax
syntax enable

set background=dark
colorscheme evening 

map <leader>f1 :set syntax=xhtml<cr>
map <leader>f2 :set ft=css<cr>
map <leader>f3 :set ft=javascript<cr>
map <leader>f4 :set syntax=python<cr>
map <leader>f5 :set ft=php<cr>
map <leader>f6 :set ft=erlang<cr>
map <leader>f7 :set ft=lua<cr>
map <leader>f8 :set ft=c<cr>
map <leader>f9 :set ft=ruby<cr>
map <leader>f$ :syntax sync fromstart<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Taglist
let Tlist_Use_Right_Window=1
let Tlist_File_Fold_Auto_Close=1


"Ctags
map <leader><F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>  

"cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-
set hidden

"OmniCppComplete
set nocp  
filetype plugin on 

"supertab
let g:SuperTabDefaultCompletionType="context"

"MiniBufExplorer
let g:miniBufExplMapWindowNavVim = 1   
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1  
let g:miniBufExplMoreThanOne=0  

map <leader>z1 : NERDTree<cr>
map <leader>z2 : TlistToggle<cr>

"Tabbar
noremap <leader>1 : tabnext 1<cr>
noremap <leader>2 : tabnext 2<cr>
noremap <leader>3 : tabnext 3<cr>
noremap <leader>4 : tabnext 4<cr>
noremap <leader>5 : tabnext 5<cr>
noremap <leader>6 : tabnext 6<cr>
noremap <leader>7 : tabnext 7<cr>
noremap <leader>8 : tabnext 8<cr>
noremap <leader>9 : tabnext 9<cr>
noremap <leader>0 : tabnext 10<cr>


function MyTabLine()
    let s = ''
    let t = ''
    for i in range(tabpagenr('$'))
	"select the highlighting
	if i + 1 == tabpagenr()
	    let s .= '%#TabLineSel#'
	    let t = '#'
	else
	    let s .= '%#TabLine#'
	    let t = ''
	endif

	" set the tab page number (for mouse clicks)
	let s .= '%' .  (i + 1) .  'T' 
	" the label is made by MyTabLabel()
	let s .= ' ' . t . '[' . (i + 1) . ':' . '%{MyTabLabel(' .  (i + 1) .  ')}' . ']' . t . ' '
    endfor

    "after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'

    " right-align the label to close the current tab page
    if tabpagenr('$') > 1
	let s .= '%=%#TabLine#%999Xclose'
    endif
    return s
endfunction

function MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    return bufname(buflist[winnr - 1])
endfunction

set tabline=%!MyTabLine()

" markdown
let g:vim_markdown_folding_disabled=1
