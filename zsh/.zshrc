export HISTFILE=$HOME/.history
export HISTSIZE=50000
export SAVEHIST=50000
setopt hist_ignore_dups
# La recherche dans  l'historique avec l'éditeur de commandes  de zsh ne
# montre  pas  une même  ligne  plus  d'une fois,  même  si  elle a  été
# enregistrée
setopt hist_find_no_dups
setopt inc_append_history
setopt share_history

setopt autocd extendedglob notify
bindkey -e
zstyle :compinstall filename '~/.zshrc'
fpath=(~/.zsh/completion $fpath)

autoload -U compinit
compinit

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

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
alias -s pdf="evince"
alias -s jar="java -jar"
export GREP_COLOR=31
alias grep='grep --color=auto'
# Gestion du 'ls' : couleur & ne touche pas aux accents
alias ls='ls --classify --tabsize=0 --literal --color=auto --show-control-chars --human-readable'
alias ctest='ctest --output-on-failure'

# Demande confirmation avant d'écraser un fichier
alias cp='cp --interactive'
alias mv='mv --interactive'
alias rm='rm --interactive'

# Raccourcis pour 'ls'
alias l="ls -alh --color=auto"
alias ll='ls -lh'
alias la='ls -ah'
alias lla='ls -la'

# Quelques alias pratiques
alias c='clear'
alias less='less --quiet'
alias df='df --human-readable'
alias du='du --human-readable'
alias man="man"
alias mutt="mutt -y"


for file in $HOME/.zsh/rc/*.rc; do
source $file
done
prompt adam1


autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

#export MAIL="/var/spool/mail/kinou/"
export PATH="$HOME/bin:/usr/lib/ccache:/usr/local/bin:/usr/local/sbin:/bin:/usr/bin:/usr/sbin:/usr/bin/X11:/usr/X11R6/bin:/usr/games:/sbin:/var/lib/gems/1.8/bin:/usr/local/heroku/bin"

# Viewer/Editeur par defaut (pour Crontab, CVS,...)
export VISUAL=vim
export EDITOR=vim
export TERMINAL=urxvt
export PAGER=most
umask 022

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

# Prompt couleur (la couleur n'est pas la même pour le root et
# pour les simples utilisateurs)
if [ "`id -u`" -eq 0 ]; then
  export PS1="%{[36;1m%}%T %{[34m%}%n%{[33m%}@%{[37m%}%m %{[32m%}%~%{[33m%}%#%{[0m%} "
else
  export PS1="%{[36;1m%}%T %{[31m%}%n%{[33m%}@%{[37m%}%m %{[32m%}%~%{[33m%}%#%{[0m%} "
fi

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

WRAPPER=$(which virtualenvwrapper.sh)
if [ -x $WRAPPER ]
then
    export WORKON_HOME=~/.virtualenvs
    mkdir -p $WORKON_HOME
    source $WRAPPER
fi

if [ -e $HOME/.rvm/scripts/rvm ]
then
    source $HOME/.rvm/scripts/rvm
fi

export PIP_DOWNLOAD_CACHE=$HOME/.pip_download_cache
#agent ssh!
if [ keychain ]
then
    eval $(keychain --eval --quiet)
elif [ -x gnome-keyring-daemon ]
then
    SSH_ENV=$HOME/.ssh/environment
    gnome-keyring-daemon -s | sed 's/^echo/#echo/' > ${SSH_ENV}
    chmod 600 ${SSH_ENV}
    . ${SSH_ENV} > /dev/null
else
    echo "NO compatible ssh-agent found (keyhain, gnome-keyring-daemon)"
fi
export DEBEMAIL="alexandre.jacquin@canaltp.fr"
export DEBFULLNAME="Alexandre JACQUIN"

if [ -e $HOME/.zsh.local ]
then
    source $HOME/.zsh.local
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

[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap
