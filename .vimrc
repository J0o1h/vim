"=========================================================================
" DesCRiption: �ʺ��Լ�ʹ�õ�vimrc�ļ���for Linux/Windows, GUI/Console
" Last Change: 2015��06��03�� 15ʱ13�� 
" Version: 1.0
"=========================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" plugin on GitHub repo
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'vim-scripts/bufexplorer.zip'
Plugin 'vim-scripts/cscope.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/DoxygenToolkit.vim'
" Plugin 'vim-scripts/winmanager'
" Plugin 'vim-scripts/project.tar.gz'

call vundle#end()

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

filetype plugin on    " required

syntax on " �Զ��﷨����
set number " ��ʾ�к�
set cursorline " ͻ����ʾ��ǰ��
" set ruler " ��״̬�����
set shiftwidth=4 " �趨 << �� >> �����ƶ�ʱ�Ŀ��Ϊ 4
set tabstop=4 expandtab " �趨 tab ����Ϊ 4 ���ո�
set nobackup
" set autochdir " �Զ��л���ǰĿ¼Ϊ��ǰ�ļ����ڵ�Ŀ¼
set backupcopy=yes " ���ñ���ʱ����ΪΪ����
set ignorecase smartcase " ����ʱ���Դ�Сд��������һ�������ϴ�д��ĸʱ�Ա��ֶԴ�Сд����
set nowrapscan " ��ֹ���������ļ�����ʱ��������
" set incsearch " ������������ʱ����ʾ�������
set hlsearch " ����ʱ������ʾ���ҵ����ı�
set noerrorbells " �رմ�����Ϣ����
set novisualbell " �ر�ʹ�ÿ�������������
set t_vb= " �ÿմ����������ն˴���
set magic " ����ħ��
set hidden " ��������δ������޸�ʱ�л�����������ʱ���޸��� vim ���𱣴�
set guioptions-=T " ���ع�����
set guioptions-=m " ���ز˵���
set smartindent " ��������ʱʹ�������Զ�����
set backspace=indent,eol,start " ���趨�ڲ���״̬�޷����˸���� Delete ��ɾ���س���
set cmdheight=1 " �趨�����е�����Ϊ 1
set laststatus=2 " ��ʾ״̬�� (Ĭ��ֵΪ 1, �޷���ʾ״̬��)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\  " ������״̬����ʾ����Ϣ
set errorformat=%m\ in\ %f\ on\ line\ %l
set autoindent 
set softtabstop=4 " ʹ�ð��˸��ʱ����һ��ɾ�� 4 ���ո�

colorscheme molokai
set t_Co=256


"-----------------------------------------------------------------
" ��ȡ��ǰϵͳ����
"------------------------------------------------------------------
function! MySys()
	if has("win16") || has("win32") || has("win64") || has("win95")
		return "windows"
	elseif has("unix")
		return "linux"
	endif
endfunction

" �û�Ŀ¼����$VIMFILES
if MySys() == "windows"
	let $VIMFILES = $VIM.'/vimfiles'
    set backupdir=D://Vim/tmp
elseif MySys() == "linux"
	let $VIMFILES = $HOME.'/.vim'
    set backupdir=~/.vim/backup
    "set backupdir=/tmp
endif

" �������� �Լ�����֧��
if has("win32")
	set guifont=Inconsolata:h12:cANSI
endif

" ���ö����Ի���
if has("multi_byte")
	" UTF-8 ����
	set encoding=utf-8
	set termencoding=utf-8
	set formatoptions+=mM
	set fencs=utf-8,gbk

	if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
		set ambiwidth=double
	endif

	if has("win32")
		source $VIMRUNTIME/delmenu.vim
		source $VIMRUNTIME/menu.vim
		language messages zh_CN.utf-8
	endif
else
	echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

" ��굽�Ϸ�����,��Ҫ<c-w><c-w>k,�ǳ��鷳,������ӳ��Ϊ<c-k>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"һЩ�����ӳ��ת���﷨�������һ���ļ��л���˲�ͬ����ʱ���ã�
nnoremap <leader>1 :set filetype=xhtml<CR>
nnoremap <leader>2 :set filetype=css<CR>
nnoremap <leader>3 :set filetype=javascript<CR>
nnoremap <leader>4 :set filetype=php<CR>

"paste ģʽ�л�
set pastetoggle=<F11>

"-----------------------------------------------------------------
" �۵�����
"
" manual �ֹ������۵�
" indent �����������ʾ���߼�����۵�
" expr �ñ��ʽ�������۵�
" syntax ���﷨�����������۵�
" diff ��û�и��ĵ��ı������۵�
" marker �����еı�־�۵�
"------------------------------------------------------------------
set foldenable
set foldmethod=indent
set foldlevel=100 " ����vimʱ��Ҫ�Զ��۵�����
set foldcolumn=0 " �����۵������


" Python �ļ���һ�����ã����粻Ҫ tab ��
" autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
" autocmd FileType python map <F12> :!python %<CR>

" ���������ֵ� ~/.vim/dict/�ļ���·��
set complete-=k complete+=k
" autocmd filetype javascript set dictionary=$VIMFILES/dict/javascript.dict
" autocmd filetype css set dictionary=$VIMFILES/dict/css.dict
au FileType php setlocal dict+=$VIMFILES/dict/php.dict


"-----------------------------------------------------------------
" plugin - winManager ���� (���ã��ܶ�Сbug)
"-----------------------------------------------------------------
" let g:winManagerWindowLayout="NERDTree,TagList"
" let g:winManagerWidth = 35
" let g:NERDTree_title="[NERDTree]"
" 
" nmap <silent> <C-m> :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR>
" " nmap <C-m> :WMToggle<CR>
" 
" function! NERDTree_Start()
" 	exec 'NERDTree'  
" endfunction
" 
" function! NERDTree_IsValid()  
" 	return 1
" endfunction


"-----------------------------------------------------------------
" plugin - doxygen toolkit ����
"-----------------------------------------------------------------
let g:DoxygenToolkit_briefTag_pre="@brief "
let g:DoxygenToolkit_paramTag_pre="@Param " 
let g:DoxygenToolkit_returnTag="@return "

let g:DoxygenToolkit_authorName="jiangyh <jiangyahui@360.cn>"
let g:DoxygenToolkit_briefTag_funcName="no"
let g:doxygen_enhanced_color=1

map fg : Dox<cr>
map ffg : DoxAuthor<cr>


"-----------------------------------------------------------------
" plugin - NERDTree ����
"-----------------------------------------------------------------
let NERDTreeWinPos="left"
let NERDTreeWinSize=30
" let NERDTreeChDirMode=1 " �ı�treeĿ¼��ͬʱ�ı乤�̵�Ŀ¼
let NERDTreeShowBookmarks=1 " ��ʱ�Զ�����ǩ

nnoremap <silent><F6> :NERDTreeToggle<CR>

"-----------------------------------------------------------------
" plugin - ctags����
"-----------------------------------------------------------------
if MySys() == "windows"
	let Tlist_Ctags_Cmd = '"'.$VIMRUNTIME.'/ctags.exe"'
elseif MySys() == "linux"
	let Tlist_Ctags_Cmd = '/usr/bin/ctags'
endif

set tags=~/acl/tags;
nnoremap <silent><F8> :!ctags -R --exclude=*.js --c++-kinds=+p --fields=+iaS --extra=+q .<CR>


"-----------------------------------------------------------------
" plugin - taglist.vim 
"-----------------------------------------------------------------
let Tlist_Show_One_File = 1 " ��ͬʱ��ʾ����ļ���tag��ֻ��ʾ��ǰ�ļ���
let Tlist_Exit_OnlyWindow = 1 " ���taglist���������һ�����ڣ����˳�vim
let Tlist_Use_Right_Window = 1 " ���Ҳര������ʾtaglist����
let Tlist_File_Fold_Auto_Close=1 " �Զ��۵���ǰ�Ǳ༭�ļ��ķ����б�
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Compact_Format = 1
" let Tlist_Display_Prototype = 0

nnoremap <silent><F7> :TlistToggle<CR>


"-----------------------------------------------------------------
" plugin - cscope����
"-----------------------------------------------------------------
set cscopequickfix=s-,c-,d-,i-,t-,e-    
if has("cscope")    
	set csprg=/usr/bin/cscope    
	set csto=1    
	set cst    
	set nocsverb    

	" add any database in current directory     
	" if filereadable("cscope.out")    
	" 	cs add cscope.out    
	" endif    
	" 	set csverb    
	" endif    
	     
	nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-@>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif


"-----------------------------------------------------------------
" plugin - project.vim  ��֯��Ŀ�б�
" \C �ݹ��ȡ��Ŀ¼ \c ��ȡ��ǰ�ļ�
" \l (�г����е�ǰ���ļ�)\L(�ݹ�),���κμ�ֹͣ
" \w (�رյ�ǰ���ļ�)\W(�ݹ�)
" \g (����Ŀ��ǰ���ļ�����)\G(�ݹ�)
" \r �ر����ļ��в�ˢ�µ�ǰ�ļ������ļ���\R�ݹ���ļ��в�ˢ�������ļ�
" \s �ر��ļ��в�������\S�ݹ���ļ��в�����
" \s ���ļ���ˮƽ�򿪶��������ʾ���򿪻�ر��ļ����б�
" \o ���ļ���һ�����ڴ򿪣��򿪻�ر��ļ����б�
" \v ���Ҵ�����ʾָ��ͣ����project���ڵ��ļ�����
" \i ��ʾ�ļ����ļ��е����ò�������filter="*"
" \I ��ʾ�ļ����ļ��еľ���·���Ͳ���
" \1 - \9��\f1-\f9��\F1-\F9ִ��ָ�����\0��ѯ1-9���\f0��ѯf1-f9��F1-F9����
" <space>�ո�����project���ڵĿ�ȣ��ָ����
"-----------------------------------------------------------------
" let proj_window_width=24
" let proj_window_increment=12
" let loaded_project = 1 " ͣ�ò��
" let proj_flags="imstcg" " �Զ�����project�б�
" nnoremap <silent><F5> :Project<CR> " F5 ��project����


"-----------------------------------------------------------------
" plugin - NERD_commenter.vim ע�ʹ����õģ�
" [count],cc �������count���������ע��(7,cc)
" [count],cu �������count������ȡ��ע��(7,cu)
" [count],cm �������count�г�����ӿ�ע��(7,cm)
" ,cA ����β���� /* */,���ҽ������ģʽ�� ��������дע�͡�
" ע��count������ѡ������Ĭ��Ϊѡ���л�ǰ��
"-----------------------------------------------------------------
let NERDSpaceDelims=1 " ��ע�ͷ������֮����һ���ո�
let NERDCompactSexyComs=1 " ����ע��ʱ���Ӹ��ÿ�


"-----------------------------------------------------------------
" plugin - ctrlp ����
"-----------------------------------------------------------------
nnoremap <silent> <C-p> :ClearAllCtrlPCache<CR>\|:CtrlP<CR>


"-----------------------------------------------------------------
" �Զ�����=��
"-----------------------------------------------------------------
function! Align_equal_mark()
    "yank current visual selection to reg x
    normal gv"xy
    "put new string value in reg x
    " would do your processing here in actual script
    let lines = split(@x, "\n")
    " calc the "=" rightest col
    let col = 0
    for line in lines
        let pos = stridx(line, '=')
        if col < pos
            let col = pos
        endif
    endfor
    " align the "="
    if col > 0
        let buf = []
        for line in lines
            let pos = stridx(line, '=')
            if pos < col
                let array = split(line, '=')
                if len(array) >= 2 
                    let array[0] .= repeat(' ', col-pos)
                    let line = join(array, '=')
                endif
            endif
            let buf += [line]
        endfor
        let buf_string = join(buf, "\n")."\n"
        let @x = buf_string
    endif
    "re-select area and delete
    normal gvd
    "paste new string value back in
    normal k"xp
endfunction
noremap ,a <Esc>:call Align_equal_mark() <CR>

