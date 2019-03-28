# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# 记录上一次路径
LAST_PWD=`pwd`
# 回到桌面路径
cd
# 获取桌面路径
CURRENT_F=`pwd`
export ZSH=$CURRENT_F"/.oh-my-zsh"
echo $ZSH
export TERM="xterm-256color" 
# 回到上一次路径
cd $LAST_PWD

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="powerlevel9k/powerlevel9k"
# ZSH_THEME="ys"
ZSH_THEME="spaceship"
POWERLEVEL9K_MODE="nerdfont-complete"












# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias java快捷键 创建项目
alias mkjava='mkjava() { 
  mkdir $1; cd $1;
  mkdir bin src; cd ..;
};mkjava' 


# 快速创建java包
# shell语法=两边不能有空格
jtouch(){
  addr=`pwd`

  # 去掉bin或src后的真实地址
  addr=${addr%/src*} # #表示操作符，*bin表示从左网右找到第一个bin值，截取之前的所有字符，如果要截取之后则##*bin
  addr=${addr%/bin*} # #表示操作符，*bin表示从左网右找到第一个bin值，截取之前的所有字符，如果要截取之后则##*bin
  # 用户输入参数
  args=$1
  # 先过滤java关键词获取需要创建的包路径字段
  arg_path=${args%/*}
  # 对路径字段进行分割
  array=(`echo $arg_path | tr '.' ' '` )
  array=(`echo $array | tr ',' ' '` )
  # echo $array[2] # 取第二个数组 # shell是从1为索引的起始

  # 提取路径最后的文件/文件夹名，用来判断是否java文件
  if [[ $args == */* ]]
  then
    javaName=${args#*/} #结果格式:abc.java
  else
    javaName='' #结果格式:abc.java
  fi

  javaKey='java'
  old=''
  for var in ${array[@]}
  do
    old=$old/$var #拼接完成绝对路径
    echo 创建路径: $addr/src/${old:1}
    mkdir $addr/src/${old:1}
    mkdir $addr/bin/${old:1}
  done

  # 判断javaName是否包含java关键字，如果是则创建
  if [[ $javaName == *$javaKey* ]]
  then
    echo 创建java文件：$javaName
    touch $addr/src/${old:1}/$javaName
    echo '成功创建Java文件'
  else
    echo 'java包已创建完毕！'
  fi

}

# 自动运行bin文件的class文件
jjava(){
  addr=`pwd`
  # 截取bin或sr前地址
  addr=${addr%/src*} # #表示操作符，*bin表示从左网右找到第一个bin值，截取之前的所有字符，如果要截取之后则##*bin
  addr=${addr%/bin*} # #表示操作符，*bin表示从左网右找到第一个bin值，截取之前的所有字符，如果要截取之后则##*bin
  args=$1 # 用户输入的第一个参数
  # 分割
  # array=(`echo $args | tr '.' ' '` )
  # array=(`echo $array | tr ',' ' '` )
  # array=(`echo $array | tr '/' ' '` )
  # old=''
  # for var in ${array[@]}
  # do
    # old=$old/$var
  # done
  echo java运行命令 java -cp $addr/bin -Djava.ext.dirs=../../lib $args
  echo -------------------------
  java -cp $addr/bin -Djava.ext.dirs=../../lib $args
}



source ~/.oh-my-zsh/plugins/incr/incr*.zsh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/local/bin/virtualenvwrapper.sh

# java环境变量
JAVA_HOME=/usr/local/java/jdk1.8.0_201
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar 
export PATH=$PATH:$JAVA_HOME/bin
