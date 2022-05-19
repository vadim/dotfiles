# vim: set filetype=sh:

# pyenv section
if [ -d "$HOME/.pyenv" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    PATH="$PYENV_ROOT/bin:$PATH"

    eval "$(pyenv init --path)"
fi

function load_macbook {
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$(brew --prefix)/lib"
    export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"

    MANPATH=/usr/local/share/man:/usr/local/man:$MANPATH

    if [ -x "$(command -v pandoc)" ]; then
        eval "$(pandoc --bash-completion)"
    fi

    # pypoetry section
    if [ -f "$HOME/.local/bin/poetry" ]; then
        PATH=$HOME/.local/bin:$PATH
    fi

    if [ -x "$(command -v nproc &> /dev/null)" ]; then
        export MAKEFLAGS="-j$(nproc)"
    fi

    export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home
}

function load_sdsc {
    module load parallel
    module load gcc/9.2.0
    module load readline/8.0
    module load ncurses/6.2

    export MAKEFLAGS="-j8"
}

case $HOSTNAME in
    wireless*) load_macbook;;
    *.local)   load_macbook;;
    login*)    load_sdsc;;
esac

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

if [ -f ~/dotfiles/git-prompt.sh ]; then
    source ~/dotfiles/git-prompt.sh
fi

if [ -f ~/dotfiles/git.bash-completion ]; then
    source ~/dotfiles/git.bash-completion
fi

if [ -f ~/dotfiles/tmux.bash-completion ]; then
    source ~/dotfiles/tmux.bash-completion
fi

if [ -f ~/dotfiles/poetry.bash-completion ]; then
    source ~/dotfiles/poetry.bash-completion
fi

if [ -r "/usr/local/etc/profile.d/bash_completion.sh" ]; then
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

# set the prompt
if [ -f ~/dotfiles/bash_prompt ]; then
    source ~/dotfiles/bash_prompt
fi

if [ -d ~/bin ]; then
    PATH=$HOME/bin:$PATH
fi

# ENVIRONMENT VARIABLES
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
export PATH
export CDPATH=".:$HOME/.dirlinks"
export BASH_SILENCE_DEPRECATION_WARNING=1
