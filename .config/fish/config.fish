# pip token, tg bot token, apple music, etc
if test -f credentials.fish
    source credentials.fish
end

set -U fish_greeting ""
set -gx UV_PYTHON 3.14t

###########
# ALIASES #
###########

alias cat 'bat --style=changes,header,rule,numbers,snip'
alias df 'duf'
alias du 'dust'
# alias ls 'lsd --group-directories-first' # preferred listing
# alias la 'lsd -A --group-directories-first' # all files and dirs
# alias ll 'lsd -l --blocks "permission,user,size,date,name" --date +"%e %b %I:%M %p" --group-directories-first --size short' # long format
# alias lla 'lsd -lA --blocks "permission,user,size,date,name" --date +"%e %b %I:%M %p" --group-directories-first --size short' # all files and dirs in long format
# alias lt 'lsd --group-directories-first --tree' # tree listing
# alias l. 'lsd -A --group-directories-first | grep "^\."' # show only dotfiles
alias clear "printf '\e[H\e[3J'" # because what the fuck kitty
alias tree 'br'

#################
# ABBREVIATIONS #
#################

abbr -a gco git checkout
abbr -a gcob git checkout -b
abbr -a gs git status
abbr -a gc git commit -aS -m
abbr -a gca git commit --amend -aS -m
abbr -a gl git log
