function    rmd              { /bin/rm -fr $@; }
function    e                { ${EDITOR} $@; }
function    p                { ${PAGER}  $@; }
function    h                { history $@; }
function    hg               { history | grep $@ | sed '$d'; }

function    ..               { cd ..; }
function    ...              { cd ../..; }
function    ....             { cd ../../..; }
function    .....            { cd ../../../..; }

function    ff               { find . -name $@ -print; }
# Find a file with a pattern in name
function    ffp              { find . -type f -iname '*'$*'*' -ls ; }

# Show the definition(s) of shell functions
function    fdef             { declare -f $1 ;}

# Process management
function    psa              { ps aux $@; }
function    psu              { ps  ux $@; }
function    psg              { ps ax | grep $@ | fgrep -v "grep $@"; }
function    lpsa             { ps aux $@ | p; }
function    lpsu             { ps  ux $@ | p; }
function    myps             { ps $@ -u $USER -o pid,%cpu,%mem,time,command ; }
function    pp               { myps f | awk '!/awk/ && $0~var' var=${1:-".*"} ; }

# Estimate file space usage 
if [[ "$OSTYPE" == darwin* ]]; then
    function    duh	             { du -d1 -h $@; }
else
    function    duh	             { du --max-depth=1 -h $@; }
fi

# Compression functions
function    co               { tar jcf $1.tar.bz2 $1; }
function    uco              { tar jxf $1; }

# List the difference between two directories
function    dirq             { diff -rq $1 $2; }

# Backup
function    bak              { cp $1 $1.bak; }

function rename {
   for f in *.$1;
      do mv $f ${f%$1}$2
   done
}

function rept { 
   delay=$1;
   shift;
   while true; do
      eval "$@";
      sleep $delay;
   done
}

# Backup functions
function buh () { cp $1 ~/.backup/${1}-`date +%Y%m%d%H%M`.backup; }

function bu () { 
    if [ "`dirname $1`" == "." ]; then 
        mkdir -p ~/.backup/`pwd`; 
        cp $1 ~/.backup/`pwd`/$1-`date +%Y%m%d%H%M`.backup; 
    else 
        mkdir -p ~/.backup/`dirname $1`; 
        cp $1 ~/.backup/$1-`date +%Y%m%d%H%M`.backup; 
    fi 
} 
