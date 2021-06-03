# vim: set filetype=sh:
function load_macbook {
    LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/local/lib

    PATH=/sbin:/usr/sbin:$PATH
    PATH=/opt/local/bin:/opt/local/sbin:$PATH

    MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH

    if [ -x "$(command -v pandoc)" ]; then
        eval "$(pandoc --bash-completion)"
    fi


    export MAKEFLAGS="-j$(sysctl -n hw.ncpu)"
}

function load_gari {
    PATH=$PATH:/gpfs/group/williamson/bin
    PATH=$PATH:$MASSACRE_PATH/bin
    PATH=$PATH:~/devel

    export R_LIBS=$HOME/R/library
    export BOWTIE2_INDEXES=$HOME/genomes/bowtie2_indexes

    module load R
    module load cmake/3.16.2
    module load gcc/7.3.0
    module load tpp/4.8.0
    module load massacre/devel
    module load blast
    module load python
    module load bowtie2
    module load samtools/1.9

    export MAKEFLAGS="-j8"
}

function load_sdsc {
    module load parallel
    module load gcc/9.2.0
    module load readline/8.0
    module load ncurses/6.2

    export MAKEFLAGS="-j8"
}

case $HOSTNAME in
    wireless*)  load_macbook;;
    *.local)    load_macbook;;
    login*)     load_sdsc;;
esac

# pyenv section
if [[ -d "$HOME/.pyenv" ]]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
fi

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi

if [ -f ~/dotfiles/tmux_completion.sh ]; then
    source ~/dotfiles/tmux_completion.sh
fi

if [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]]; then
    source "/usr/local/etc/profile.d/bash_completion.sh"
fi

if [ -d ~/usr/local/bin ]; then
    UL="$HOME/usr/local"
    PATH=${UL}/bin:$PATH
    MANPATH=${MANPATH}:${UL}/man:${UL}/share/man
    LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${UL}/lib
    PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:{UL}/lib/pkgconfig

    unset UL
fi

# source the conda startup
if [ -f ~/dotfiles/conda.bash ]; then
    source ~/dotfiles/conda.bash
fi

# set the prompt
if [ -f ~/.bash_prompt ]; then
    source ~/.bash_prompt
fi

#####################################
# ##### ENVIRONMENT VARIABLES ##### #
#####################################
export GREP_COLORS="ms=01;31:mc=01;31:sl=:cx=:fn=35:ln=32:bn=32:se=36"

export CLICOLOR=true
export PAGER=less
export LESS="-eRX"
export EDITOR=vim

export HISTIGNORE="&:cd:[bf]g:x:c:w:qs:qsc:..:l:ll:ls:llr:myps"
export HISTCONTROL=ignoreboth
export HISTSIZE=1000
export HISTFILESIZE=1000
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S:  "

export PROMPT_COMMAND='history -a'
export PROMPT_DIRTRIM=3

export MANPATH
export PATH=$HOME/bin:$PATH

export CDPATH=".:$HOME/.dirlinks"

export BASH_SILENCE_DEPRECATION_WARNING=1
