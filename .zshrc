# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/zhangwenting/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
#ZSH_THEME="ys"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

## 需要安装 autojump
#plugins=(git colored-man-pages colorize cp man command-not-found sudo ubuntu archlinux zsh-navigation-tools z extract history-substring-search autojump python)
plugins=(git)
source $ZSH/oh-my-zsh.sh

###################! User configuration !###################
###################!  后配置的优先级高   !###################
## pkg_config path
export LD_LIBRARY_PATH=/usr/lib:/usr/lib/x86_64-redhat-linux6E/lib64:$LD_LIBRARY_PATH
## pkg_config path
export PKG_CONFIG_PATH="/usr/lib64/pkgconfig:/usr/share/pkgconfig"

## CUDA ##
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

## CUDNN ##
export LD_LIBRARY_PATH=/home/share/cudnn-8.0-v5.1/lib64:$LD_LIBRARY_PATH

###################! app !###################
## ffmpeg 4.3 ##
# export PATH=/home/zhangwenting/app/ffmpeg-4.3.1-amd64-static:$PATH

## TensorRT ##
# export LD_LIBRARY_PATH=/home/zhangwenting/app/TensorRT-7.2.1.6/lib:$LD_LIBRARY_PATH

## patch 2.7.1 ##
# export PATH=/home/zhangwenting/app/Patch-2.7.1/bin:$PATH

## Advance cp mv ##
export PATH=/home/zhangwenting/app/advcpmv/bin:$PATH

## atlas 3.10.1 (for caffe) ##
# export LD_LIBRARY_PATH=/home/zhangwenting/app/atlas-3.10.1/lib64:$LD_LIBRARY_PATH

# ## openblas 0.3.3 (for caffe) ##
# export LD_LIBRARY_PATH=/home/zhangwenting/app/OpenBLAS-0.3.3/lib64:$LD_LIBRARY_PATH

## protoc-3.15.8 (for caffe) ##
# export PATH=/home/zhangwenting/app/protoc-3.15.8-linux-x86_64/bin:$PATH

## cmake-3.20.1-linux-x86_64 ##
export PATH=/home/zhangwenting/app/cmake-3.20.1-linux-x86_64/bin:$PATH

## libunwind-1.1 (for caffe)
# export LD_LIBRARY_PATH=/home/zhangwenting/app/libunwind-devel-1.1/lib:$LD_LIBRARY_PATH

###################! zzapps !###################
export ZZROOT="/home/zhangwenting/zzapp"
export PATH=$ZZROOT/bin:$PATH
export LD_LIBRARY_PATH=$ZZROOT/lib:$ZZROOT/lib64:$LD_LIBRARY_PATH
## ccache ##
export CCACHE_DIR=~/.ccache

## opencv 4.3 ##
export OpenCV_DIR=$ZZROOT
export PKG_CONFIG_PATH=$ZZROOT/lib64/pkgconfig:$PKG_CONFIG_PATH

## boost 1.73 ##
# export BOOST_ROOT=$ZZROOT
# 使用 boost 编译的动态链接库
# export LD_LIBRARY_PATH=/home/zhangwenting/zzapp/src/boost/stage/lib:$LD_LIBRARY_PATH


## >>> conda initialize >>> ##
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/zhangwenting/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/zhangwenting/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/zhangwenting/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/zhangwenting/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
## <<< conda initialize <<< ##

export PYTHONPATH=/home/zhangwenting/app/caffe/python:$PYTHONPATH

################### ! annaconda     yyds ! ###################
################### ! conda环境优先级最高 ! ###################
###### /home/zhangwenting/anaconda3/envs/torch11 ######
# conda install -c conda-forge glog: 直接gflag和glog装好了，nb
# conda install -c conda-forge zlib: 
# bin  compiler_compat  conda-meta  include  lib  man  share  ssl  x86_64-conda_cos6-linux-gnu

# export CONDA_ROOT="/home/zhangwenting/anaconda3/envs"
# export PATH=/home/zhangwenting/anaconda3/envs/torch11/bin:$PATH
# export LD_LIBRARY_PATH=/home/zhangwenting/anaconda3/envs/torch11/lib:$LD_LIBRARY_PATH
# export LD_LIBRARY_PATH=/home/zhangwenting/anaconda3/envs/torch11/x86_64-conda_cos6-linux-gnu/sysroot/lib:$LD_LIBRARY_PATH
# export PKG_CONFIG_PATH=/home/zhangwenting/anaconda3/envs/torch11/lib/pkgconfig:$PKG_CONFIG_PATH

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

## 输入法，ibus和fcitx
# export GTK_IM_MODULE=fcitx
# export QT_IM_MODULE=fcitx
# export QT4_IM_MODULE=fcitx
# export XMODIFIERS=@im=fcitx

alias cls="clear"
alias ts="tmux split-window" # 垂直分屏
alias cp="cpg -g" # 带进度条的复制
alias pg='ps aux | grep $1' # 查找进程
alias tar-x='tar -xvf' # 解压tar
alias tar-c='tar -cvf' # 制作tar
alias tar-s='tar -tf' # 显示tar内容
alias wget='wget -c ' # 断点续传的wget
alias ping='ping -c 5' # 限制ping5次输出
alias ipe='curl ipinfo.io/ip' # 公网ip
alias ipi='ipconfig getifaddr en0' # 局域网ip
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias ns="nvidia-smi"
alias gpu="watch --color -n1 gpustat -cpu"
alias vs="tmux split-window" # vertical split
alias hs="tmux split-window -h" # horizontal split
alias gpusearch="fuser -v /dev/nvidia*" # search PID on your GPU
alias gpuwatch="watch --color -n1 gpustat -cpu" # show gpustat every 1 sec
alias cmake=/home/zhangwenting/app/cmake-3.20.1-linux-x86_64/bin/cmake
alias cmake2=/usr/bin/cmake 

## 安装trash-cli
## trash-cli 常用功能
## trash-put 将文件或目录移入回收站
## trash-empty 清空回收站
## trash-list 列出回收站中的文件
## trash-restore 还原回收站中的文件
## trash-rm 删除回首站中的单个文件
# 禁用rm很重要！
alias rm='echo "This is not the command you are looking for."; false'
alias rrm='trash-put'
alias rmclean='trash-empty'
alias rmrest='trash-restore'
alias rmlist='trash-list'
# alias rmrm='trash-rm'

## 安装 zsh-syntax-highlighting 不同发行版安装位置不同修改路径
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## 安装 zsh-autosuggestions 不同发行版安装位置不同修改路径
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
## 修改提示字符颜色
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=cyan"
