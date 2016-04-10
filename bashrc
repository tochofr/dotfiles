# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# ====== Set-up variables ======
curPlatform=$(uname)
lang="en_US.UTF-8"
curEditor=$(which vim)
# ==== End Set-up variables ====

if [[ $curPlatform == "Darwin" ]]; then
    export CLICOLOR=1
    export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
fi

export EDITOR=${curEditor}

# ====== History section ======
export HISTCONTROL=ignoredups
export HISTIGNORE="ls*:ll*:l*:clear:history:exit"
# ==== End History section ====

# ====== Locales section ======
if [ -z ${LANGUAGE+x} ]; then export LANGUAGE=${lang}; fi
if [ -z ${LC_ALL+x} ]; then export LC_ALL="${lang}"; fi
# ==== End Locales section ==== 

# ====== Aliases section ======
if [[ $curPlatform == "Darwin" ]]; then
    export LS_OPTIONS='-G'
else
    export LS_OPTIONS='--color=auto'
    eval "`dircolors`"
fi
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l -h'
alias l='ls $LS_OPTIONS -lA'
# ==== End Aliases section ====

# ====== Custom functions section ======

# Colors in man pages
man() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

if [[ $curPlatform == "Darwin" ]]; then
    cdf() {
        target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
        if [ "$target" != "" ]; then
            cd "$target"; pwd
        else
            echo 'No Finder window found' >&2
        fi
    }
fi
# ==== End Custom functions section ====
