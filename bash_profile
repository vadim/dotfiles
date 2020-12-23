# vim: set filetype=sh:

function load_macbook {
    LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/local/lib

    PATH=/sbin:/usr/sbin:$PATH
    PATH=/opt/local/bin:/opt/local/sbin:$PATH

    MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH

    if [ -x "$(command -v pandoc)" ]; then
        eval "$(pandoc --bash-completion)"
    fi
}

function load_hpc {
    PATH=$PATH:/gpfs/group/williamson/bin
    PATH=$PATH:$MASSACRE_PATH/bin
    PATH=$PATH:~/devel

    export R_LIBS=$HOME/R/library
    export BOWTIE2_INDEXES=$HOME/genomes/bowtie2_indexes

    module load R
    module load tpp/4.8.0
    module load massacre/devel
    module load blast
    module load python
    module load bowtie2
    module load samtools/1.9
}

case $HOSTNAME in
    wireless*)  load_macbook;;
    *.local)    load_macbook;;
    garibaldi*) load_hpc;;
    login0*)    load_hpc;;
    gpfs*)      load_hpc;;
    node*)      load_hpc;;
esac

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi

if [ -f ~/dotfiles/tmux_completion.sh ]; then
    source ~/dotfiles/tmux_completion.sh
fi

if [ -d ~/python ]; then
    PYTHONPATH=$PYTHONPATH:~/python/lib/python2.7/site-packages
    PATH=~/python/bin:$PATH
fi

if [ -d ~/usr/local/bin ]; then
    PATH=~/usr/local/bin:$PATH
    MANPATH=$MANPATH:~/usr/local/man
    MANPATH=$MANPATH:~/usr/local/share/man
    LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/usr/local/lib
fi

# set the prompt
if [ -f ~/.bash_prompt ]; then
    source ~/.bash_prompt
fi

#####################################
# ##### ENVIRONMENT VARIABLES ##### #
#####################################
export GREP_OPTIONS="--color=auto -r --binary-files=without-match --exclude-dir=.git"
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

export MAKEFLAGS="-j$(sysctl -n hw.ncpu)"

export MANPATH
export PYTHONPATH
export PATH=$HOME/bin:$PATH

export CDPATH=".:$HOME/.dirlinks"
