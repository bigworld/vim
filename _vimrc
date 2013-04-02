" {{{
" Author:      Asins - asinsimple AT gmail DOT com
"              Get latest vimrc from http://nootn.com/lab/vim
" Last Change: 2013-04-02
"}}}

" {{{ 全局设置
" 关闭 vi 兼容模式
set nocompatible
" 检测文件类型插件
filetype plugin indent on
" 设置leader为,
let mapleader=","
let maplocalleader=","

" 自动运用设置
autocmd! BufWritePost _vimrc silent source $VIM/_vimrc
nmap <leader>e :tabedit $MYVIMRC<cr>
" 允许在有未保存的修改时切换缓冲区
set hidden
" 自动语法高亮
syntax on
" 不设定在插入状态无法用退格键和 Delete 键删除回车符
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
" 显示行号
set number
" 上下可视行数
set scrolloff=6
" 设定 tab 长度为 4
set tabstop=4
" 设置按BackSpace的时候可以一次删除掉4个空格
set softtabstop=4
" 设定 << 和 >> 命令移动时的宽度为 4
set shiftwidth=4
set smarttab
set history=1024
" 不突出显示当前行
set nocursorline
" 覆盖文件时不备份
set nobackup
" 自动切换当前目录为当前文件所在的目录
set autochdir
" 搜索时忽略大小写，但在有一个或以上大写字母时仍大小写敏感
set ignorecase
set smartcase
" 搜索到文件两端时不重新搜索
set nowrapscan
" 实时搜索
set incsearch
" 搜索时高亮显示被找到的文本
set hlsearch
" 关闭错误声音
set noerrorbells
set novisualbell
set t_vb=

"How many tenths of a second to blink
set mat=2
" 智能自动缩进
set smartindent
"显示括号配对情况
set showmatch

" 显示Tab符
set list
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
"启动时不显示 捐赠提示
set shortmess=atl
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,slash,unix,resize

" 设定doc文档目录
let helptags=$VIMFILES."/doc"
set helplang=cn

"编辑vim配置文件
if has("unix")
    set fileformats=unix,dos,mac
	let $VIMFILES = $HOME."/.vim"
else
    set fileformats=dos,unix,mac
	let $VIMFILES = $VIM."/vimfiles"
endif

" }}}

" {{{ plugin for vundle
filetype off "必要关闭
" more script see: http://vim-scripts.org/vim/scripts.html
set rtp+=$VIMFILES/bundle/vundle/
call vundle#rc()
let g:bundle_dir = $VIMFILES.'/bundle'

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Docs
Bundle 'asins/vimcdoc'

" dict {{{
Bundle 'asins/vim-dict'
"<ctrl-x>_<ctrl-k> 打开提示
autocmd filetype javascript setlocal dictionary+=$VIMFILES/bundle/vim-dict/dict/javascript.dic
autocmd filetype javascript setlocal dictionary+=$VIMFILES/bundle/vim-dict/dict/node.dic
autocmd filetype css setlocal dictionary+=$VIMFILES/bundle/vim-dict/dict/css.dic
autocmd filetype php setlocal dictionary+=$VIMFILES/bundle/vim-dict/dict/php.dic
" }}}

" Color
Bundle 'asins/vim-colors'
Bundle 'tpope/vim-vividchalk'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'w0ng/vim-hybrid'
" 设定配色方案
colorscheme molokai

" Syntax
Bundle 'othree/html5.vim'
Bundle 'nono/jquery.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'python.vim--Vasiliev'
Bundle 'xml.vim'
Bundle 'tpope/vim-markdown'
Bundle 'asins/vim-css'

" {{{ Coffee相关
" npm install -g coffee-script coffeelint
Bundle 'kchmck/vim-coffee-script'
" 自动生成代码
autocmd! BufWritePost *.coffee silent CoffeeMake!
" }}}

"{{{ 对齐代码
Bundle 'Eivy/Align'
" 原有,tt冲突
map <Leader>tT <Plug>AM_tt
" }}}

" Code Completins
" {{{ plugin/neocomplcache.vim 自动提示插件
"Bundle 'Shougo/neocomplcache'
"let g:neocomplcache_enable_at_startup=1
"let g:neocomplcache_disable_auto_complete = 1 "禁用自动完成
"let g:neocomplcache_enable_smart_case=1
"let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"set completeopt-=preview
"启用自动代码提示
"nmap <Leader>ne :NeoComplCacheToggle<CR>
"" Define dictionary.
"let g:neocomplcache_dictionary_filetype_lists = {
	"\ 'default' : '',
	"\ 'css' : $VIMFILES.'/dict/css.dic',
	"\ 'php' : $VIMFILES.'/dict/php.dic',
	"\ 'javascript' : $VIMFILES.'/dict/javascript.dic'
	"\ }
" }}}

" {{{ Snippet
Bundle "honza/snipmate-snippets"
Bundle "Shougo/neosnippet"
let g:neosnippet#snippets_directory=$VIMFILES.'/bundle/snipmate-snippets/snippets'
" Plugin key-mappings.
imap <C-k> <Plug>(neocomplcache_snippets_force_expand)
smap <C-k> <Plug>(neocomplcache_snippets_force_expand)
imap <C-l> <Plug>(neocomplcache_snippets_force_jump)
smap <C-l> <Plug>(neocomplcache_snippets_force_jump)
" }}}

" {{{ 代码垂直移动
Bundle 'vim-scripts/upAndDown'
vmap <silent> <a-j> <Plug>upAndDownVisualDown
vmap <silent> <a-k> <Plug>upAndDownVisualUp

" }}}


" {{{ HTML/XML缩进 ragtag.vim
Bundle 'tpope/vim-ragtag'
let g:html_indent_script1 = "zero"
let g:html_indent_style1 = "zero"
" }}}
" {{{ ZenCoding.vim 很酷的插件，HTML代码生成
Bundle 'ZenCoding.vim'
" 常用命令可看：http://nootn.com/blog/Tool/23/
" https://raw.github.com/mattn/zencoding-vim/master/TUTORIAL
let g:user_zen_settings = {
	\ 'lang': "zh-cn"
	\ }
" <c-y>m  合并多行
" }}}

	" {{{
	Bundle "groenewege/vim-less"
	au BufNewFile,BufRead *.less setf less
	autocmd BufWritePost *_src.less
	\ execute '!node d:\Code\less\bin\lessc -x --include-path=D:\htdocs\tudou.com\static\skin\ % > %:t:r.css'
	" }}}

" Indent
Bundle 'IndentAnything'
Bundle 'Javascript-Indentation'
Bundle 'gg/python.vim'

" Plugin
	" {{{ svn.vim--McCoy svn操作
	"Bundle 'svn.vim--McCoy'
	"<Leader><LocalLeader>c  - Calls :Svn commit
	"<Leader><LocalLeader>C  - Calls :Svn complete
	"<Leader><LocalLeader>u  - Calls :Svn update
	"<Leader><LocalLeader>l  - Calls :Svn log
	"<Leader><LocalLeader>a  - Calls :Svn add
	" }}}

	" Omnifunc {{{
	" <c-x>_<c-o> 打开提示
	Bundle 'teramako/jscomplete-vim'
	autocmd FileType javascript setl omnifunc=jscomplete#CompleteJS
	let g:jscomplete_use = ['dom', 'moz', 'es6th']
	" }}}

"Bundle 'L9'

"Bundle 'vimux'

	" {{{ asins/template.vim 文件模板
	Bundle 'asins/template.vim'
	let g:template_author = "Asins"
	" }}}

	"{{{ tpope/vim-fugitive Git命令集合
	Bundle 'tpope/vim-fugitive'
	if executable('git')
		nnoremap <silent> <leader>gs :Gstatus<CR>
		nnoremap <silent> <leader>gd :Gdiff<CR>
		nnoremap <silent> <leader>gc :Gcommit<CR>
		nnoremap <silent> <leader>gb :Gblame<CR>
		nnoremap <silent> <leader>gl :Glog<CR>
		nnoremap <silent> <leader>gp :Git push<CR>
	endif
	"}}}

"Bundle 'FencView.vim'
"Bundle 'hallettj/jslint.vim'

	" {{{ bufexplorer.vim Buffers切换
	Bundle 'vim-scripts/bufexplorer.zip'
	" \be 全屏方式查看全部打开的文件列表
	noremap <silent> <c-q> :BufExplorer<CR>
	" \bs 上下方式查看
	noremap <silent> <a-q> :BufExplorerHorizontalSplit<CR>
	" \bv 左右方式查看
	noremap <silent> <s-q> :BufExplorerVerticalSplit<CR>
	
	let g:bufExplorerDefaultHelp=0      " 不显示默认帮助信息
	let g:bufExplorerShowRelativePath=1 " 显示相对路径
	let g:bufExplorerSortBy='mru'       " 使用最近使用的排列方式
	let g:bufExplorerSplitRight=0       " 居左分割
	let g:bufExplorerSplitVertical=1    " 垂直分割
	let g:bufExplorerSplitVertSize = 30 " Split width
	let g:bufExplorerUseCurrentWindow=1 " 在新窗口中打开
	autocmd BufWinEnter \[Buf\ List\] setl nonumber
	" }}}

	" {{{ NERDtree 文件管理器
	Bundle 'scrooloose/nerdtree'
	" 让Tree把自己给装饰得多姿多彩漂亮点
	let NERDChristmasTree=1
	" 控制当光标移动超过一定距离时，是否自动将焦点调整到屏中心
	let NERDTreeAutoCenter=1
	" 指定书签文件
	let NERDTreeBookmarksFile=$VIMFILES.'\NERDTree_bookmarks'
	" 指定鼠标模式(1.双击打开 2.单目录双文件 3.单击打开)
	let NERDTreeMouseMode=2
	" 是否默认显示书签列表
	let NERDTreeShowBookmarks=1
	" 是否默认显示文件
	let NERDTreeShowFiles=1
	" 是否默认显示行号
	let NERDTreeShowLineNumbers=0
	" 窗口位置（'left' or 'right'）
	let NERDTreeWinPos='left'
	" 窗口宽度
	let NERDTreeWinSize=31
	nnoremap <Leader>tt :NERDTree<CR>
	"}}}

	" {{{ The-NERD-Commenter 注释代码用的，以下映射已写在插件中
	Bundle 'The-NERD-Commenter'
	let NERDMenuMode = 0
	" <leader>ca 在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//
	" <leader>cc 注释当前行
	" <leader>cs 以”性感”的方式注释
	" <leader>cA 在当前行尾添加注释符，并进入Insert模式
	" <leader>cu 取消注释
	" <leader>cm 添加块注释
	" }}}

	" {{{ auto_mkdir 自动创建目录
	Bundle 'auto_mkdir'
	" }}}

	" {{{ mru.vim 记录最近打开的文件
	Bundle 'mru.vim'
	let MRU_File = $VIM."/_vim_mru_files"
	let MRU_Max_Entries = 1000
	let MRU_Add_Menu = 0
	nmap <leader>f :MRU 
	" }}}

	" {{{ majutsushi/tagbar 代码导航
	Bundle 'majutsushi/tagbar'
	if has("unix")
		let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
	else
		let g:tagbar_ctags_bin = $VIM.'/ctags.exe'
	endif
	let g:tagbar_autofocus = 1
	nmap <leader>tl :TagbarToggle<CR>
	" }}}

	" {{{ CmdlineComplete 命令行模式下自动补全
	Bundle 'CmdlineComplete'
	" Ctrl + p 向后切换
	" Ctrl + n 向前切换
	" }}}

	" {{{ colorizer 颜色显示插件
	Bundle 'colorizer'
	" <leader>tc 切换高亮
	" :ColorHighlight  - start/update highlighting
	" :ColorClear      - clear all highlights
	" :ColorToggle     - toggle highlights
	" }}}

	" {{{ asins/jsbeautify 优化js代码，并不是简单的缩进，而是整个优化
	Bundle 'asins/jsbeautify'
	" 开始优化整个文件
	nmap <silent> <leader>js :call g:Jsbeautify()<cr>
	" }}}

	" {{{ asins/renamer.vim 文件重命名
	Bundle 'asins/renamer.vim'
	" :Renamer 将当前文件所在文件夹下的内容显示在一个新窗口
	" :Ren 开始重命名
	"}}}
	
	" {{{ mikeage/ShowMarks 设置标记（标签）
	Bundle 'mikeage/ShowMarks'
	let g:showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	let g:showmarks_ignore_type = "hqm"
	" m{mark} 设置标记  '{mark} 移动到标记
	"<Leader>mt   - 打开/关闭ShowMarks插件
	"<Leader>mh   - 清除当前行的标记
	"<Leader>ma   - 清除当前缓冲区中所有的标记
	"<Leader>mm   - 在当前行打一个标记，使用下一个可用的标记名
	"}}}
	
	" {{{ ctrlp.vim 文件搜索
	Bundle 'ctrlp.vim'
	"set wildignore+=*/tmp/*,*.so,*.swp,*.zip  " MacOSX/Linux
	set wildignore+=tmp\*,*.swp,*.zip,*.exe   " Windows
	let g:ctrlp_custom_ignore = {
	  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
	  \ 'file': '\.exe$\|\.so$\|\.dll$',
	  \ 'link': 'some_bad_symbolic_links',
	  \ }
	let g:ctrlp_working_path_mode=1
	"let g:ctrlp_clear_cache_on_exit=0
	let g:ctrlp_cache_dir=$VIM.'/_ctrlp'
	let g:ctrlp_extensions=['tag', 'buffertag', 'quickfix', 'dir', 'rtscript']
	nmap <a-p> :CtrlP D:/htdocs/tudou.com/<cr>
	"<c-d> 切换完全/只文件名搜索
	"<c-r> 切换搜索匹配模式：字符串/正则
	" }}}

	" {{{ matchit.zip 对%命令进行扩展使得能在嵌套标签和语句之间跳转
	Bundle 'matchit.zip'
	" % 正向匹配      g% 反向匹配
	" [% 定位块首     ]% 定位块尾
	"}}}

	" {{{ MatchTag HTML标签高亮配对
	Bundle 'MatchTag'
	" }}}

	" {{{ Mark 给各种tags标记不同的颜色，便于观看调式的插件。
	Bundle 'Mark'
	" 这样，当我输入“,hl”时，就会把光标下的单词高亮，在此单词上按“,hh”会清除该单词的高亮。如果在高亮单词外输入“,hh”，会清除所有的高亮。
	" 你也可以使用virsual模式选中一段文本，然后按“,hl”，会高亮你所选中的文本；或者你可以用“,hr”来输入一个正则表达式，这会高亮所有符合这个正则表达式的文本。
	nmap <silent> <leader>hl <plug>MarkSet
	vmap <silent> <leader>hl <plug>MarkSet
	nmap <silent> <leader>hh <plug>MarkClear
	vmap <silent> <leader>hh <plug>MarkClear
	nmap <silent> <leader>hr <plug>MarkRegex
	vmap <silent> <leader>hr <plug>MarkRegex
	" 你可以在高亮文本上使用“,#”或“,*”来上下搜索高亮文本。在使用了“,#”或“,*”后，就可以直接输入“#”或“*”来继续查找该高亮文本，直到你又用“#”或“*”查找了其它文本。
	" <silent>* 当前MarkWord的下一个     <silent># 当前MarkWord的上一个
	" <silent>/ 所有MarkWords的下一个    <silent>? 所有MarkWords的上一个
	"}}}
	filetype plugin indent on " 使用vundle关闭，结束时开始
" }}}

" {{{ 查找光标位置的单词并生成结果列表
function! QuickSearchList(visual, ...)
	if empty(expand("%"))
		return 0
	endif
	if a:visual
		let l:saved_reg = @"
		execute "normal! vgvy"
		let	l:pattern = escape(@", '\\/.*$^~[]')
		let l:pattern = substitute(l:pattern, "\n$", "", "")
		let @" = l:saved_reg
	else
		if exists("a:1")
			let l:pattern = a:1
		else
			let l:pattern = expand("<cword>")
		endif
	endif
	execute ":vimgrep /" . l:pattern . "/ %"
	execute ":copen"
	let @/ = l:pattern
    nnoremap <buffer> <silent> q :close<CR>
endfunction

command! -nargs=+ SearchList call QuickSearchList(0, <f-args>)
" 全文搜索选中的文字
vmap <silent><leader>f :call QuickSearchList(1)<cr>
" }}}

autocmd filetype css vnoremap <leader>on J:s/\s*\([{:,;]\)\s*/\1/g<CR>:let @/=''<cr>
autocmd filetype css nnoremap <leader>on :s/\s*\([{:,;]\)\s*/\1/g<CR>:let @/=''<cr>

" Alt-W切换自动换行
noremap <a-w> :exe &wrap==1 ? 'set nowrap' : 'set wrap'<cr>

" 复制选中文本到系统剪贴板
vnoremap <leader>yo "*y
" 从系统剪贴板粘贴内容
nnoremap <leader>po "*p
" 选中模式 Ctrl+c 复制选中的文本
vnoremap <c-c> "+y
" 普通模式下 Ctrl+c 复制文件路径
nnoremap <c-c> :let @+ = expand('%:p')<cr>

"set nobomb

if !exists('g:VimrcIsLoad')
	set termencoding=chinese
	set fileencodings=ucs-bom,utf-8,cp936,cp950,latin1
	set ambiwidth=double
	set guifont=YaHei\ Mono:h12
	set linespace=0
	" 解决自动换行格式下, 如高度在折行之后超过窗口高度结果这一行看不到的问题
	set display=lastline
	language messages zh_CN.UTF-8
	set langmenu=zh_CN.UTF-8
	set guioptions-=m " 隐藏菜单栏
	set guioptions-=T " 隐藏工具栏
	set guioptions-=L " 隐藏左侧滚动条
	set guioptions-=r " 隐藏右侧滚动条
	set guioptions-=b " 隐藏底部滚动条
	set showtabline=0 " Tab栏
	" 显示状态栏 (默认值为 1, 无法显示状态栏)
	set laststatus=2
	" 设置在状态行显示的信息
	set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%)
endif


" 删除所有行未尾空格
nnoremap <silent> <f12> :%s/[ \t\r]\+$//g<cr>

" 窗口切换
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k

" Buffers/Tab操作快捷方式!
nnoremap <s-h> :bprevious<cr>
nnoremap <s-l> :bnext<cr>
nnoremap <s-j> :tabnext<cr>
nnoremap <s-k> :tabprev<cr>
"nnoremap F :tabe %

" 插入模式下上下左右移动光标
inoremap <a-h> <left>
inoremap <a-l> <right>
inoremap <a-j> <c-o>gj
inoremap <a-k> <c-o>gk

"一些不错的映射转换语法（如果在一个文件中混合了不同语言时有用）
nnoremap <leader>1 :set filetype=xhtml<cr>
nnoremap <leader>2 :set filetype=css<cr>
nnoremap <leader>3 :set filetype=javascript<cr>
nnoremap <leader>4 :set filetype=php<cr>

" {{{ TUDOU 打开项目中的文件
function! GetImportFile()
	let prefpath = 'D:\htdocs\tudou.com\static\'
	let filepath = substitute(getline('.'), '\s*\*\s*@import\s*', '', '')
	let filename = fnamemodify(filepath, ":t")
	if fnamemodify(filepath, ':e') == "css"
		let prefpath = prefpath . 'skin\'
	else
		let prefpath = prefpath . 'js\'
	endif
	let fullfilepath = substitute(prefpath . filepath, '/', '\', 'g')
	execute ":e " fullfilepath
	if findfile(filename, fnamemodify(fullfilepath, ':p:h')) == ""
		echo 'File not exist, Create now: '. fullfilepath
	endif
endfunction
nmap <silent> <leader>gf :call GetImportFile()<cr>
" }}}

"{{{ Folding 折叠
"折叠相关的快捷键
"zR 打开所有的折叠
"zo 展开折叠
"zO 对所在范围内所有嵌套的折叠点展开
"zc 折叠
"[z 到当前打开的折叠的开始处。
"]z 到当前打开的折叠的末尾处。
"zj 向下移动。到达下一个折叠的开始处。关闭的折叠也被计入。
"zk 向上移动到前一折叠的结束处。关闭的折叠也被计入。
set foldenable
" 设置语法折叠
" manual  手工定义折叠
" indent  更多的缩进表示更高级别的折叠
" expr    用表达式来定义折叠
" syntax  用语法高亮来定义折叠
" diff    对没有更改的文本进行折叠
" marker  对文中的标志折叠
set foldmethod=marker
" 设置代码块折叠后显示的行数
set foldexpr=1
" 设置折叠层数为
set foldlevel=0
" 设置折叠区域的宽度
set foldcolumn=0
set switchbuf=usetab,newtab
" 新建的文件，刚打开的文件不折叠
autocmd! BufNewFile,BufRead * setlocal nofoldenable
" }}}

" VimFiles {{{
autocmd Filetype vim noremap <buffer> <F1> <Esc>:help <C-r><C-w><CR>
" }}}
" Arch Linux {{{
autocmd BufNewFile,BufRead PKGBUILD setlocal syntax=sh ft=sh
autocmd BufNewFile,BufRead *.install setlocal syntax=sh ft=sh
" }}}
" HTML {{{
autocmd FileType html,xhtml setlocal smartindent foldmethod=indent
" }}}
" CSS {{{
autocmd FileType css setlocal smartindent foldmethod=indent
autocmd FileType css setlocal noexpandtab tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.scss setlocal ft=scss
" 删除一条CSS中无用空格
autocmd filetype css vnoremap <leader>co J:s/\s*\([{:;,]\)\s*/\1/g<CR>:let @/=''<cr>
autocmd filetype css nnoremap <leader>co :s/\s*\([{:;,]\)\s*/\1/g<CR>:let @/=''<cr>
" }}}
" Javascript {{{
autocmd BufRead,BufNewFile jquery.*.js setlocal ft=javascript syntax=jquery
autocmd BufRead,BufNewFile *.tpl setlocal ft=tpl syntax=html
" JSON syntax
autocmd BufRead,BufNewFile *.json setlocal ft=json
" }}}
" Markdown {{{
autocmd FileType markdown set shiftwidth=4 expandtab
autocmd BufNewFile,BufRead *.mk setlocal filetype=markdown
" }}}

" Python 文件的一般设置，比如不要 tab 等
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab

" {{{ linux 下非root用户保存
" cmap w!! w !sudo tee % > /dev/null
" }}}

" {{{ Win平台下窗口全屏组件 gvimfullscreen.dll
" Alt + Enter 全屏切换
" Shift + t 降低窗口透明度
" Shift + y 加大窗口透明度
" Shift + r 切换Vim是否总在最前面显示
" Vim启动的时候自动使用当前颜色的背景色以去除Vim的白色边框
if has('gui_running') && has('gui_win32') && has('libcall')
    let g:MyVimLib = 'gvimfullscreen.dll'
    function! ToggleFullScreen()
        call libcall(g:MyVimLib, 'ToggleFullScreen', 1)
    endfunction

    let g:VimAlpha = 245
    function! SetAlpha(alpha)
        let g:VimAlpha = g:VimAlpha + a:alpha
        if g:VimAlpha < 180
            let g:VimAlpha = 180
        endif
        if g:VimAlpha > 255
            let g:VimAlpha = 255
        endif
        call libcall(g:MyVimLib, 'SetAlpha', g:VimAlpha)
    endfunction

    let g:VimTopMost = 0
    function! SwitchVimTopMostMode()
        if g:VimTopMost == 0
            let g:VimTopMost = 1
        else
            let g:VimTopMost = 0
        endif
        call libcall(g:MyVimLib, 'EnableTopMost', g:VimTopMost)
    endfunction
    "映射 Alt+Enter 切换全屏vim
    map <a-enter> <esc>:call ToggleFullScreen()<cr>
    "切换Vim是否在最前面显示
    nmap <s-r> <esc>:call SwitchVimTopMostMode()<cr>
    "增加Vim窗体的不透明度
    nmap <s-t> <esc>:call SetAlpha(10)<cr>
    "增加Vim窗体的透明度
    nmap <s-y> <esc>:call SetAlpha(-10)<cr>
    " 默认设置透明
    autocmd GUIEnter * call libcallnr(g:MyVimLib, 'SetAlpha', g:VimAlpha)
endif
" }}}

" {{{ 回车时前字符为{时自动换行补全
function! <SID>OpenSpecial(ochar,cchar)
	let line = getline('.')
	let col = col('.') - 2
	if(line[col] != a:ochar)
		if(col > 0)
			return "\<esc>a\<CR>"
		else
			return "\<CR>"
		endif
	endif
	if(line[col+1] != a:cchar)
		call setline('.',line[:(col)].a:cchar.line[(col+1):])
	else
		call setline('.',line[:(col)].line[(col+1):])
	endif
	return "\<esc>a\<CR>;\<CR>".a:cchar."\<esc>\"_xk$\"_xa"
endfunction
inoremap <silent> <CR> <C-R>=<SID>OpenSpecial('{','}')<CR>
" }}}

" {{{ Fast edit hosts file
function! FlushDNS()
	python import sys
	exe 'python sys.argv = ["ipconfig /flushdns"]'
endfunction
nmap <silent> <Leader>host :tabnew c:\windows\system32\drivers\etc\hosts<CR>
nmap <silent> <Leader>dns :!ipconfig /flushdns<CR><space>
"autocmd! bufwritepost hosts call FlushDNS()
" }}}

" {{{ NodeJs UglifyJs 压缩/美化/解释
function! UglifyJs(...)
	if(expand("%:e") != "js")
		echo "Not a JS file."
		return
	endif
	let s:chr = get(a:000, 0, 'min')
	let s:filePath = expand("%:p")
	let s:outPath = expand("%:p:r").'-'.s:chr.'.js'
	if(s:chr == 'min')
		let s:param = '-c -m'
	elseif(s:chr == 'b')
		let s:param = '-c -b'
	endif
	exe '!cmd.exe /s /c pushd & "c:/Program Files/nodejs/node.exe" d:/Code/Uglify-js/bin/uglifyjs "'.s:filePath.'" '.s:param.' -o "'.s:outPath.'"'
	echo 'output to:'.s:outPath.' success!'
endfunction
command! -nargs=* -bar Wjs call UglifyJs(<f-args>)
"}}}


let g:VimrcIsLoad=1 " source时让一些设置不再执行
