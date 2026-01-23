source "$HOME/.config/fish/functions/t7unmount.fish"

function t7check
    set -l device

    if test -z $argv[1]
        set device /dev/sda
    else
        set device $argv[1]
    end

    _t7_info "checking Samsung T7 Shield mount status"

    for block in $device{1,2,3}
        findmnt $block >/dev/null; and _t7_info "$block is mounted"; or _t7_error "$block is not mounted"
    end
end

