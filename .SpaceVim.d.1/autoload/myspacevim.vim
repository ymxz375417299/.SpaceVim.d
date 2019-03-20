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

  " ctralp快速搜索配置
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif "
  MacOSX/Linux
  let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$']

  " java配置
  let g：JavaComplete_ClosingBrace = 1 
  nmap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
  nmap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
  nmap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
  nmap <leader>jii <Plug>(JavaComplete-Imports-Add)

  imap <C-j>I <Plug>(JavaComplete-Imports-AddMissing)
  imap <C-j>R <Plug>(JavaComplete-Imports-RemoveUnused)
  imap <C-j>i <Plug>(JavaComplete-Imports-AddSmart)
  imap <C-j>ii <Plug>(JavaComplete-Imports-Add)

  nmap <leader>jM <Plug>(JavaComplete-Generate-AbstractMethods)

  imap <C-j>jM <Plug>(JavaComplete-Generate-AbstractMethods)

  nmap <leader>jA <Plug>(JavaComplete-Generate-Accessors)
  nmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
  nmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
  nmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
  nmap <leader>jts <Plug>(JavaComplete-Generate-ToString)
  nmap <leader>jeq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
  nmap <leader>jc <Plug>(JavaComplete-Generate-Constructor)
  nmap <leader>jcc <Plug>(JavaComplete-Generate-DefaultConstructor)

  imap <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)
  imap <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)
  imap <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)

  vmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
  vmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
  vmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)

  nmap <silent> <buffer> <leader>jn <Plug>(JavaComplete-Generate-NewClass)
  nmap <silent> <buffer> <leader>jN <Plug>(JavaComplete-Generate-ClassInFile)
  template：[subirectory]：/ package.ClassName extends SuperClass implements Interface（String str，public Integer i）：contructor（*）：toString（1）



endfunction
