function! s:__class_class(class, options)
    let file_path=expand('%:h') "获取当前目录绝对路径
    let path_list=split(file_path, '/src')
    echo path_list
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

    for fieldKey in keys(get(a:options, 'fields', {}))
        let field = a:options['fields'][fieldKey]
        let result .= field['mod']. " ". field['type']. " ". field['name']. ";\n"
    endfor
    return result . "\n}"
endfunction
