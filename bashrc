# vim: set filetype=sh:
if [ -r /opt/applications/Modules/current/init/bash ]; then
    source /opt/applications/Modules/current/init/bash
fi

if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

# source bash completion
if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

# source custom bash completions
if [ -f $HOME/.bash_completion ]; then
    source $HOME/.bash_completion
fi

# source custom bash completions
if [ -f /usr/local/etc/profile.d/bash_completion.sh ]; then
    source /usr/local/etc/profile.d/bash_completion.sh
fi

# source custom aliases
if [ -f $HOME/.aliases ]; then
    source $HOME/.aliases
fi

# source bash functions
if [ -f $HOME/.bash_functions ]; then
    source $HOME/.bash_functions
fi

# source dircolors definitions
if [ "$OSTYPE" == linux* ]; then
    if [ -f "$HOME/.dir_colors" ]; then
        eval $(dircolors -b $HOME/.dir_colors)
    fi
fi

ulimit -S -c 0        # Don't want any coredumps
set -o noclobber
set -o ignoreeof

shopt -s cdspell
shopt -s checkhash
shopt -s checkwinsize
shopt -s sourcepath
shopt -s no_empty_cmd_completion
shopt -s expand_aliases

# shopt -s cdable_vars
# shopt -s mailwarn
# shopt -s cmdhist
# shopt -s histappend histreedit histverify
# shopt -s lithist
# shopt -s extglob
# shopt -s dotglob
# shopt -s progcomp
# shopt -s promptvars
# shopt -s hostcomplete
# shopt -s interactive_comments

complete -d pd cd rmd
complete -C /usr/local/bin/terraform terraform
complete -C /usr/local/bin/aws_completer aws

# pyenv section
if [ -d "$HOME/.pyenv" ]; then
    eval "$(pyenv init -)"
fi
