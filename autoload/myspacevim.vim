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

  "快速生成断点代码
  imap <leader>l <Esc>Oimport ipdb; ipdb.set_trace() # TODO BREAKPOINT<Esc>:w<cr>
  nmap <leader>l <Esc>Oimport ipdb; ipdb.set_trace() # TODO BREAKPOINT<Esc>:w<cr>

  " nerdtree 目录树
  nmap ,v :NERDTreeFind<cr>
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
    exec "cd %:p:h"
    let file_name= expand('%:t') "当前文件名
    let path = path_list[0] . '/bin' . path_list[1]
    exec "!javac -cp ../../lib:../../bin -Djava.ext.dirs=../../lib -d ../../bin " . file_name
    echo 'bin编译成功: ' . path
  else
    " 从工作区跳转到当前目录
    exec "cd %:p:h"
    exec "!javac %"
    echo "原地编译" . file_path
  endif


endfunction

