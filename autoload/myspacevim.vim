function! myspacevim#before() abort
  "设置leader键 映射
  let mapleader = ","
  let g:mapleader=','

  " 使用 jj 映射 esc  进入 normal 模式
  inoremap jj <Esc>`^
  inoremap hhh <Esc>`^
  inoremap kkk <Esc>`^
  inoremap lll <Esc>`^
  inoremap ooo <Esc>`^o
  inoremap OOO <Esc>`^O

  "快速生成断点代码
  imap <leader>l <Esc>Oimport ipdb; ipdb.set_trace() # TODO BREAKPOINT<Esc>:w<cr>
  nmap <leader>l <Esc>Oimport ipdb; ipdb.set_trace() # TODO BREAKPOINT<Esc>:w<cr>

  " nerdtree 目录树
  nmap ,g :NERDTreeToggle<cr>


  " neoformat 自动格式化 
  nmap ,p :Neoformat<cr>

  " 使用 leader+w 直接保存 替换:w 直接在编辑模式保存
  inoremap <leader>w <Esc>:w<cr>
  noremap <leader>w :w<cr>

  "设置窗口移动快捷键
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H>


  "java的class文件
  nmap <leader>z :call CompileRunGcc()<CR>


  "java代码缩进PEP8风格
  " au BufNewFile,BufRead *.java,*.pyw set tabstop=4
  " au BufNewFile,BufRead *.java,*.javaw set softtabstop=4
  " au BufNewFile,BufRead *.java,*.javaw set shiftwidth=4
  " au BufNewFile,BufRead *.java,*.javaw set textwidth=100 "每行代码最大长度
  " au BufNewFile,BufRead *.java,*.javaw set expandtab
  " au BufNewFile,BufRead *.java,*.javaw set autoindent
  " au BufNewFile,BufRead *.java,*.javaw set fileformat=unix
  
  "python代码缩进PEP8风格
  au BufNewFile,BufRead *.py,*.pyw set tabstop=4
  au BufNewFile,BufRead *.py,*.pyw set softtabstop=4
  au BufNewFile,BufRead *.py,*.pyw set shiftwidth=4
  au BufNewFile,BufRead *.py,*.pyw set textwidth=100 "每行代码最大长度"
  au BufNewFile,BufRead *.py,*.pyw set expandtab
  au BufNewFile,BufRead *.py,*.pyw set autoindent
  au BufNewFile,BufRead *.py,*.pyw set fileformat=unix
  
  ""对其他文件类型设置au命令
  au BufNewFile,BufRead *.js, *.html, *.css set tabstop=2
  au BufNewFile,BufRead *.js, *.html, *.css set softtabstop=2
  au BufNewFile,BufRead *.js, *.html, *.css set shiftwidth=2

  "高亮显示行伟不必要的空白字符
  highlight Whitespace ctermbg=red guibg=red
  au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match Whitespace /\s\+$\ \+/
  

  "Java补全插件JavaComplete2
  let g:JavaComplete_EnableDefaultMappings = 1

  " 添加模板路径
  let g:JavaComplete_CustomTemplateDirectory = '~/jc_templates'
  
  "设置分割窗口 默认打开底部或者右边
  set splitbelow
  set splitright
  " CtrlP 忽略文件
  let g:loaded_ctrlp = 0
  
  " 语法树映射快捷键leader + v
  nnoremap <silent> <leader>v :call TagbarOpen()<CR>
  " autocmd VimEnter * nested :TagbarOpen
  " autocmd VimEnter * nested :call tagbar#autoopen(1)
  " autocmd FileType * nested :call tagbar#autoopen(1)
  " autocmd FileType c,cpp nested :TagbarOpen
   autocmd BufEnter * nested :call tagbar#autoopen(0)
endfunction



function! TagbarOpen()
  exec "w"
  exec "TagbarToggle"
endfunction







" 根据文件类型自动保存和编译
function! CompileRunGcc()
  " 判断退出语句
  " 执行W保存
  exec "w"
  if &filetype == 'java'
    call JavaC()
  endif
endfunction


" 编译java文件到bin目录下
function! JavaC()
  let file_path=expand('%:p') "获取当前目录绝对路径
  let path_list=split(file_path, '/src')
  let list_len =  len(path_list)
  if len(path_list) == 2
    " 从工作区跳转到当前目录
    echo "执行目录" . path_list[0] .'/src'
    exec "cd " . path_list[0] . '/src'
    let path = path_list[0] . '/bin' . path_list[1][1:]
    exec "!mkdir ../bin"
    exec "!javac -cp ../lib:../bin -Djava.ext.dirs=../lib -d ../bin -sourcepath ../src " . path_list[1][1:]
    echo 'bin编译成功: ' . path
  else
    " 从工作区跳转到当前目录
    exec "cd %:p:h"
    exec "!javac %"
    echo "原地编译" . file_path
  endif
endfunction

