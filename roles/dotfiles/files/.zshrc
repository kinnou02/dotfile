#internal Function
# Returns whether the given command is executable or aliased.
_has() {
  return $( whence $1 >/dev/null )
}


export HISTFILE=$HOME/.history
export HISTSIZE=1000000
export SAVEHIST=1000000
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt inc_append_history
setopt share_history
setopt EXTENDED_HISTORY # Write the history file in the ":start:elapsed;command" format.
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_ALL_DUPS # Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.


setopt autocd extendedglob notify
bindkey -e
zstyle :compinstall filename '~/.zshrc'
fpath=(~/.zsh/completion $fpath)
fpath=(~/.zsh_completion.d $fpath)

autoload -U compinit
compinit

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

autoload -U bashcompinit
bashcompinit

zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:mv:*' ignore-line yes
zstyle ':completion:*:cp:*' ignore-line yes


zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}'
zstyle ':completion:*' max-errors 3 numeric
zstyle ':completion:*' use-compctl false


autoload -U compinit
compinit
autoload bashcompinit && bashcompinit
complete -C "$HOME/.local/bin/aws_completer" aws

setopt correct
setopt autopushd

autoload -U promptinit
promptinit



# Je ne veux JAMAIS de beeps
unsetopt beep
unsetopt hist_beep
unsetopt list_beep
# Ctrl+D est équivalent à 'logout'
unsetopt ignore_eof
# Affiche le code de sortie si différent de '0'
setopt print_exit_value
# Demande confirmation pour 'rm *'
unsetopt rm_star_silent
# Si on utilise des jokers dans une liste d'arguments, retire les jokers
# qui ne correspondent à rien au lieu de donner une erreur
setopt nullglob

# Options de complétion
# Quand le dernier caractère d'une complétion est '/' et que l'on
# tape 'espace' après, le '/' est effacé
setopt auto_remove_slash
# Ne fait pas de complétion sur les fichiers et répertoires cachés
unsetopt glob_dots
# Traite les liens symboliques comme il faut
setopt chase_links
# Quand l'utilisateur commence sa commande par '!' pour faire de la
# complétion historique, il n'exécute pas la commande immédiatement
# mais il écrit la commande dans le prompt
setopt hist_verify
# Si la commande est invalide mais correspond au nom d'un sous-répertoire
# exécuter 'cd sous-répertoire'
setopt auto_cd
# L'exécution de "cd" met le répertoire d'où l'on vient sur la pile
setopt auto_pushd
# Ignore les doublons dans la pile
setopt pushd_ignore_dups
# N'affiche pas la pile après un "pushd" ou "popd"
setopt pushd_silent
# "pushd" sans argument = "pushd $HOME"
setopt pushd_to_home

# Les jobs qui tournent en tâche de fond sont nicé à '0'
unsetopt bg_nice
# N'envoie pas de "HUP" aux jobs qui tourent quand le shell se ferme
unsetopt hup


#alias


for file in $HOME/.zsh/rc/*.rc; do
source $file
done
#prompt adam1


autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line


#export MAIL="/var/spool/mail/kinou/"
#export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:/bin:/usr/bin:/usr/sbin:/usr/bin/X11:/usr/X11R6/bin:/usr/games:/sbin"

PATH=$(pathmunge $PATH "/sbin" before)
PATH=$(pathmunge $PATH "/usr/sbin" before)
PATH=$(pathmunge $PATH "$HOME/bin" before)
PATH=$(pathmunge $PATH "$HOME/go/bin" after)
PATH=$(pathmunge $PATH "$HOME/.local/bin/" before)

# Viewer/Editeur par defaut (pour Crontab, CVS,...)
if [ -x $(command -v nvim) ]; then
    export VISUAL=nvim
    export EDITOR=nvim
else
    export VISUAL=vim
    export EDITOR=vim
fi
export TERMINAL=alacritty
export BROWSER=google-chrome
umask 022

if [ -x $(command -v most) ]; then
    export PAGER=most
fi

# Correspondance touches-fonction
bindkey '^A' beginning-of-line # Home
bindkey '^E' end-of-line # End
bindkey '^D' delete-char # Del
bindkey '^[[3~' delete-char # Del
bindkey '^[[5~' history-search-backward # PgUp
bindkey '^[[6~' history-search-forward # PgDn
bindkey "\e[2~" overwrite-mode # Insert
bindkey "\e[4~" end-of-line # End
bindkey "\e[1~" beginning-of-line #Home
bindkey "^[OH" beginning-of-line #home
bindkey "^[OF" end-of-line #end
# Correspondance touches-fonction
bindkey '[2~' overwrite-mode          # Insert

# Prise en charge des touches [début], [fin] et autres
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char


# Titre de la fenêtre d'un xterm
case $TERM in
   xterm*)
       precmd () {print -Pn "\e]0;%n@%m: %~\a"}
       ;;
esac

# Gestion de la couleur pour 'ls' (exportation de LS_COLORS)
if [ -x /usr/bin/dircolors ]
then
  if [ -r ~/.dir_colors ]
  then
    eval "`dircolors ~/.dir_colors`"
  elif [ -r /etc/dir_colors ]
  then
    eval "`dircolors /etc/dir_colors`"
  else
    eval "`dircolors`"
  fi
fi



export PIP_DOWNLOAD_CACHE=$HOME/.pip_download_cache
#agent ssh!
KEYCHAIN=$(command -v keychain)
if [ -x "$KEYCHAIN" ]
then
    eval $($KEYCHAIN --eval --quiet)
elif [ -x "$(command -v gnome-keyring-daemon)" ]
then
    SSH_ENV=$HOME/.ssh/environment
    gnome-keyring-daemon -s | sed 's/^echo/#echo/' > ${SSH_ENV}
    chmod 600 ${SSH_ENV}
    . ${SSH_ENV} > /dev/null
else
    echo "NO compatible ssh-agent found (keyhain, gnome-keyring-daemon)"
fi
export DEBEMAIL="alexandre.jacquin@kisio.com"
export DEBFULLNAME="Alexandre JACQUIN"

if [ -e $HOME/.zsh.local ]
then
    source $HOME/.zsh.local
fi
if [ -e $SSHHOME/.sshrc.d/.zsh.local ]
then
    source $SSHHOME/.sshrc.d/.zsh.local
fi

bindkey "^X^E" edit-command-line
#Ctrl-W delete the last word, or to the first /
my-backward-delete-word() {
    local WORDCHARS=${WORDCHARS/\//}
    zle backward-delete-word
}
zle -N my-backward-delete-word
bindkey '^W' my-backward-delete-word

RUST_BACKTRACE=1
compdef sshrc=ssh

# Make CTRL-Z background things and unbackground them.
function fg-bg() {
  if [[ $#BUFFER -eq 0 ]]; then
    fg
  else
    zle push-input
  fi
}
zle -N fg-bg
bindkey '^Z' fg-bg

[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap

#FZF
if _has rg; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


ANTIBODY=$(command -v antibody)
if [ -x "$ANTIBODY" ]
then
    source <(antibody init)
    $($ANTIBODY bundle zdharma/fast-syntax-highlighting)
    $($ANTIBODY bundle zsh-users/zsh-completions)
fi
#source $HOME/.zsh/colors

# add the previous command to pet
function prev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new `printf %q "$PREV"`"
}

function pet-select() {
  BUFFER=$(pet search --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N pet-select
stty -ixon
bindkey '^s' pet-select

SANDBOXRC=~/.zsh/sandboxrc
source ~/.zsh/sandboxd
# RVM configuration
#sandbox_init_rvm() {
#  if [ -f /usr/share/rvm/scripts/rvm ]; then
#     source /usr/share/rvm/scripts/rvm
#  fi
#}
#sandbox_hook rvm rvm


sandbox_init_python(){
    WRAPPER=$(command -v virtualenvwrapper.sh)
    export WORKON_HOME=~/.virtualenvs
    mkdir -p $WORKON_HOME
    source $WRAPPER
}

sandbox_hook python workon
sandbox_hook python mkvirtualenv

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#export PATH="$PATH:$HOME/.rvm/bin"
#

# prioritoze directory in mv completion args
zstyle ':completion:*' group-name ''
compdef _gnu_generic mv
zstyle -e :completion::complete:mv:argument-rest: list-dirs-first \
          '(( ! ${words[(I)--target-directory=*]} )) &&
          compset -N "-*"; reply=( $((CURRENT > 1)) )'
