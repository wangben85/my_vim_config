" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

"Gvim simply setting overall, e.g dont show the menus"
set gfn=Courier_New:h14
colorscheme torte
set guioptions-=m
set guioptions-=T
set guifont=Courier_new:h10

set encoding=utf-8
"**************************************************************Personal Setting for Ben Start"
colorscheme desert                       "set background scheme
set number                               "set the source file has number
syntax enable
syntax on
set nu!
"Make vim does NOT generate Temporary file"
set noundofile                           
set nobackup                            
set noswapfile                           

autocmd GUIEnter * simalt ~x             "defulat set the Gvim the max window size
set nocompatible                         "set vim does not compatible to vi"
set softtabstop=3                        "Set tab size = 3 "
set expandtab
set sw=3                                 "remove the tabs in the beginning
set shiftwidth=4                         "Set shift wdith = 4 "
set autoindent                           "Turn on audo indent"
filetype on
filetype plugin on
filetype indent on
set cursorline                           "enable the cursor line"
set autoread                             "enable auto read"
set autowrite                            "enable auto write"
set ignorecase                           "ignore the case when doing search"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Taghighlight setting
":colorscheme bandit

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"ctags setting***********************"
set tags=tags;
set autochdir
"Jump to definition remap "it could be coverd in cscope, then comment this line 
:map <A-d> <C-]>                             
"Go back where to call the definition
:map <A-q> <C-t>                         
"Go forward where to call the definition
:map <A-w> <C-o>                             

"taglist setting*********************"
let Tlist_Show_One_File=1                "Only show the current file' tags 
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=1
""let Tlist_Auto_Open=1                  "It will be done by below g:winManagerWindowLayout
let Tlist_Process_File_Always=1          "Real time refresh the tags
"remap 'tl' to turn on/off taglist
:nmap tl :Tlist<CR>
"let Tlist_Sort_Type = "name"             "Make the tags sort by name(alphabet)
let Tlist_Sort_Type = "order"             "Make the tags sort by order

"WinManager setting*****************"
let g:winManagerWindowLayout='FileExplorer|TagList'    "Important: Set the WinManager and Taglist layout
let g:AutoOpenWinManager=1               "Auto Turn on winManager"
"remap 'wm' to turn on/off winmanager"
:nmap wm :WMToggle<CR>

"Cscope Setting********************"
set cscopequickfix=s-,c-,d-,i-,t-,e-           "Important: Make the cscope find results route to quickfix window
"Quickfix Setting******************"
map <F6>s :cs find s <C-R>=expand("<cword>")<CR><CR>

"map <F6>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"Jump to definition below, and turn on Quick fix window, could be covered by
"'ctags'
"map <A-d> :cs find g <C-R>=expand("<cword>")<CR><CR>     "Comment here

"map <F6>c :cs find c <C-R>=expand("<cword>")<CR><CR> :cw<CR>
"Jump to Function Caller below,turn on Quick fix window"
map <A-c> :cs find c <C-R>=expand("<cword>")<CR><CR> :cw<CR>

"map <F6>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"Jump to String Caller below,turn on Quick fix window"
map <A-s> :cs find t <C-R>=expand("<cword>")<CR><CR> :cw<CR>

map <F6>e :cs find e <C-R>=expand("<cword>")<CR><CR>

"map <F6>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"Open the current file
map <A-o> :cs find f <C-R>=expand("<cfile>")<CR><CR>

map <F6>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
map <F6>d :cs find d <C-R>=expand("<cword>"(<CR><CR>
"map cw :cw<cr>
"Jump to last finding in quickfix window
map <F7> :cp<cr>
"Jump to next finding in quickfix window
map <F8> :cn<cr>

"omnicppcomplete setting*****************
set completeopt=menu,longest,menuone
let OmniCpp_NamespaceSearch = 2
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 
let OmniCpp_MayCompleteDot = 1   
let OmniCpp_MayCompleteArrow = 1 
let OmniCpp_MayCompleteScope = 1 
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
let OmniCpp_SelectFirstItem = 2
let OmniCpp_DisplayMode=1

"other keys remap*******************"
"automatically complete keys"
inoremap [ []<Esc>i
inoremap ] []<Esc>i
inoremap ( ()<Esc>i
inoremap ) ()<Esc>i
inoremap { {<CR>}<Esc>O
inoremap } {<CR>}<Esc>O
inoremap < <><Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>

"go the tail of line remap"
map 9 <S-$>

"Multiply windows movement remap*****"
"switch to the left window"
:map <S-h> <C-w>h         
"switch to the right window"
:map <S-l> <C-w>l         
"switch to the up window"
:map <S-k> <C-w>k         
"switch to the down window"
:map <S-j> <C-w>j

"Commenter remap
"Comment one line
:map <A-f> \cc   
"Uncomment one line
:map <A-z> \cu

"Switch between Cpp\Header filer remap"
nnoremap <silent> <F4> :A<CR>

"Grep command remap"
nnoremap <silent> <F3> :Grep<CR>                
"Grep_Default_Options readme
"-i : ignore the case when doing the search
"-r : Search recursively, to find the subfolder
"--include : only search the *.cpp, *.hpp, *.c, *.h type and *.py files
"--exclude-dir : exclude the dir to search
:let Grep_Default_Options = '-ir --include=*.cmake --include=*.py --include=*.cpp --include=*.hpp --include=*.c --include=*.h --exclude-dir="tests" --exclude-dir=".svn" --exclude-dir="mocks" --exclude-dir="fake"'
"Grep_Default_Filelist readme
"The folder/files to be search
"!!!!!!!!!!!!!!Important notes: please make sure the end of the path does NOT contain '\' or
"'\**',etc.  Which will make the recusively search or exclude-dir issue!!!!!!! 

"Source path
"""""""""""""""""""""""""""""""""""""""""""""""AD3""""""""""""""""""""""""""""""""""""""""""""""
"grep AD3 files development branch
"let Grep_Default_Filelist = 'C:\Shure_SVN_repo\Projects\Blackhawk\BH_TX\BHTX_App\branches\AD3_DEV_BRANCH\Application'

"grep AD3 files trunk 
let Grep_Default_Filelist = 'C:\Shure_SVN_repo\Projects\Blackhawk\BH_TX\BHTX_App\trunk\Application'

"""""""""""""""""""""""""""""""""""""""""""""""ADX5""""""""""""""""""""""""""""""""""""""""""""""
"grep ADX5 files development branch
"let Grep_Default_Filelist = 'C:\Shure_SVN_repo\Projects\Blackhawk\ADx5\ADx5_App\branches\Ben_Dev_Branch\Application'

"grep ADX5 files trunk 
"let Grep_Default_Filelist = 'C:\Shure_SVN_repo\Projects\Blackhawk\ADx5\ADx5_App\trunk\Application'

"""""""""""""""""""""""""""""""""""""""""""""""Python test scripts""""""""""""""""""""""""""""""""""""""""""""""
"grep AD3 python scripts path
"let Grep_Default_Filelist = 'C:\Other_Code_Repo\python_in_shure\bhtx_python'

"grep ADX5 python scripts path
"let Grep_Default_Filelist = 'C:\Other_Code_Repo\python_in_shure\adx5_python'

"Example multiple path test below"
":let Grep_Default_Filelist = 'C:\Shure_SVN_repo\Projects\Blackhawk\BH_TX\BHTX_App\branches\low_power_review\Application\AppMain C:\Shure_SVN_repo\Projects\Blackhawk\BH_TX\BHTX_App\branches\low_power_review\Application\AudioMgmt C:\Shure_SVN_repo\Projects\Blackhawk\BH_TX\BHTX_App\branches\low_power_review\Application\UI'  
"*******************************************************************Personal Setting for Ben End"

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
set diffexpr=MyDiff()
endif
function MyDiff()
let opt = '-a --binary '
if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
let arg1 = v:fname_in
if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
let arg1 = substitute(arg1, '!', '\!', 'g')
let arg2 = v:fname_new
if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
let arg2 = substitute(arg2, '!', '\!', 'g')
let arg3 = v:fname_out
if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
let arg3 = substitute(arg3, '!', '\!', 'g')
if $VIMRUNTIME =~ ' '
if &sh =~ '\<cmd'
  if empty(&shellxquote)
	 let l:shxq_sav = ''
	 set shellxquote&
  endif
  let cmd = '"' . $VIMRUNTIME . '\diff"'
else
  let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
endif
else
let cmd = $VIMRUNTIME . '\diff'
endif
let cmd = substitute(cmd, '!', '\!', 'g')
silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction
