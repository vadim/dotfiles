# vim: set filetype=sh:

function load_macbook {
    LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/local/lib
    PATH=/sbin:/usr/sbin:/usr/texbin:$PATH
    PATH=/opt/local/bin:/opt/local/sbin:$PATH
    PATH=/usr/local/git/bin:$PATH

    if [ -d /opt/local/lib/mysql56/bin ]; then
        PATH=/opt/local/lib/mysql56/bin:$PATH
    fi

    PATH=$HOME/bin:$PATH
    MANPATH=$MANPATH:/opt/local/man
}

function load_hpc {
    #export MASSACRE_PATH=~/software/massacre_devel
    PATH=$PATH:/gpfs/group/williamson/bin
    PATH=$PATH:$MASSACRE_PATH/bin
    PATH=$PATH:~/devel
    export R_LIBS=~/R/library

    module load tpp
    module load python
    module load R
    module load bioperl
    module load massacre
    module load blast
    module load openms
}

case $HOSTNAME in
    patsalo*)   load_macbook;;
    garibaldi*) load_hpc;;
    gpfs*)      load_hpc;;
    node*)      load_hpc;;
esac

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi

# perl section
if [ -d ~/usr/perl5 ]; then
    PERL5LIB=$PERL5LIB:~/usr/perl5/lib/perl5/

fi

if [ -f ~/perl5/perlbrew/etc/bashrc ]; then
	source ~/perl5/perlbrew/etc/bashrc
	source ~/perl5/perlbrew/etc/perlbrew-completion.bash
fi

if [ -f ~/dotfiles/tmux_completion.sh ]; then
    source ~/dotfiles/tmux_completion.sh
fi

if [ -d ~/perl5 ]; then
    PERL5LIB=$PERL5LIB:~/perl5/lib/perl5/
    MANPATH=$MANPATH:~/perl5/man
    PATH=~/perl5/bin:$PATH
fi

export PERL_MM_OPT="INSTALL_BASE=${HOME}/perl5"
export PERL5LIB=$PERL5LIB:~/software/msparser/perl512

# rbenv section
if [ -d ~/.rbenv ]; then
    PATH="~/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
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

# haskell section
if [ -d ~/Library/Haskell/bin ]; then
    PATH=~/Library/Haskell/bin:$PATH
fi

if [ -d /usr/local/smlnj-110.75/ ]; then
    PATH=$PATH:/usr/local/smlnj-110.75/bin
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
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S:  "

export PROMPT_COMMAND='history -a'
export PROMPT_DIRTRIM=3

export MAKEFLAGS='-j4'

export MANPATH
export PYTHONPATH
export PATH

##
# Your previous /Users/vadim/.bash_profile file was backed up as /Users/vadim/.bash_profile.macports-saved_2014-12-26_at_11:26:45
##

# MacPorts Installer addition on 2014-12-26_at_11:26:45: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


##
# Your previous /Users/vadim/.bash_profile file was backed up as /Users/vadim/.bash_profile.macports-saved_2015-04-22_at_14:24:49
##

# MacPorts Installer addition on 2015-04-22_at_14:24:49: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


##
# Your previous /Users/vadim/.bash_profile file was backed up as /Users/vadim/.bash_profile.macports-saved_2015-10-16_at_07:34:40
##

# MacPorts Installer addition on 2015-10-16_at_07:34:40: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

