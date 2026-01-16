function info
    set_color --bold brcyan
    echo -n "INFO: "
    set_color white
    echo $argv
    set_color normal
end

function warn
    set_color --bold bryellow
    echo -n "WARN: "
    set_color white
    echo $argv
    set_color normal
end

function error
    set_color --bold brred
    echo -n "ERR: "
    set_color red
    echo $argv >&2
    set_color normal
end

if not command -q git; or not command -q rsync
    error "git and rsync must be installed"
    exit 1
end

set -l fish_backup_dir $HOME/fish.bak
if test -e $HOME/.config/fish; and not test -d $fish_backup_dir
    info "backing up old fish config dir to $fish_backup_dir"
    if test -d $fish_backup_dir
        rm -rf $fish_backup_dir
    end
    # mv $HOME/.config/fish $fish_backup_dir  # this will move the symlink instead of copying
    cp -rv (readlink -f $HOME/.config/fish) $HOME/fish.bak
end

if test -d $HOME/hakimi-dotfiles
    info "updating dotfiles"
    git -C $HOME/hakimi-dotfiles pull --rebase
else
    info "cloning dotfiles"
    git clone https://github.com/hakimifr/dotfiles $HOME/hakimi-dotfiles
end

info "syncing dotfiles with rsync"
rsync -ah --info=progress1 $HOME/hakimi-dotfiles/.config/fish $HOME/.config/fish

info "installing fisher"
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source; and fisher install jorgebucaran/fisher

info "restarting fish"
exec fish
