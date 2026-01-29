# pip token, tg bot token, apple music, etc
if test -f $HOME/.config/fish/credentials.fish
    source $HOME/.config/fish/credentials.fish
end

fish_add_path -Pp $HOME/.cargo/bin $HOME/bin $HOME/.local/bin $BUN_INSTALL/bin

set -gx fish_greeting ""
set -gx fish_prompt_pwd_full_dirs 1000
set -gx UV_PYTHON 3.14
set -gx -- EDITOR zed --wait
set -gx GIT_PAGER delta

set -gx BUN_INSTALL "$HOME/.bun"

###########
# ALIASES #
###########

alias cat 'bat --style=changes,header,rule,numbers,snip'
alias df duf
alias du dust
# alias ls 'lsd --group-directories-first' # preferred listing
# alias la 'lsd -A --group-directories-first' # all files and dirs
# alias ll 'lsd -l --blocks "permission,user,size,date,name" --date +"%e %b %I:%M %p" --group-directories-first --size short' # long format
# alias lla 'lsd -lA --blocks "permission,user,size,date,name" --date +"%e %b %I:%M %p" --group-directories-first --size short' # all files and dirs in long format
# alias lt 'lsd --group-directories-first --tree' # tree listing
# alias l. 'lsd -A --group-directories-first | grep "^\."' # show only dotfiles
alias clear "printf '\e[H\e[3J'" # because what the fuck kitty

#################
# ABBREVIATIONS #
#################

abbr -a gco git checkout
abbr -a gcob git checkout -b
abbr -a gs git status
abbr -a gc git commit -aS -m
abbr -a gca git commit --amend -aS -m
abbr -a gl git log
abbr -a gd git diff
abbr -a glo git log --oneline | head -n5
abbr -a gp git push
abbr -a gpf git push --force-with-lease
abbr -a gpff git push --force

##############
# TOOLS INIT #
##############

zoxide init fish | source
source (/usr/bin/starship init fish --print-full-init | psub)
