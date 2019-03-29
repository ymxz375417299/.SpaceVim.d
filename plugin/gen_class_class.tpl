function! s:__class_class(class, options)
    let file_path=expand('%:h') "获取当前目录绝对路径
    let classname = input("please input classname\n") " 获取用户输入的类名
    " 如果有输入classname 则不生成package代码
    if len(classname) 
      let result = "\n \n"
      let result .= "class ". classname
      let result .= " {\n"
    else
      let path_list=split(file_path, '/src')
      if len(path_list) == 2
        let current_package=path_list[1][1:]
        let current_package= join(split(current_package, '/'), '.')
      else
        let current_package=path_list[0][1:]
        let current_package= split(current_package, '/')[-1]
      endif
      " 生成package代码
      let result = "package ". current_package .";\n\n"
      let result .= "public class ". a:options.name
      let result .= " {\n"
    endif

    for fieldKey in keys(get(a:options, 'fields', {}))
        let field = a:options['fields'][fieldKey]
        let result .= field['mod']. " ". field['type']. " ". field['name']. ";\n"
    endfor
    return result . "\n}"
endfunction
