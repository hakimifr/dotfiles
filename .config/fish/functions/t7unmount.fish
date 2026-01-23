# Function to unmount my Samsung T7 Shield with ease

function t7unmount
    set -l device

    if test -z $argv[1]
        set device /dev/sda
    else
        set device $argv[1]
    end

    _t7_info "unmounting T7 Shield at $device"
    for block in $device{1,2,3}
        udisksctl unmount -b $block
    end

    _t7_info "powering off T7 Shield"
    udisksctl power-off -b $device

    if test $status -eq 0
        _t7_info success
        _t7_info "the Samsung T7 Shield is now safe to be disconnected"
    else
        _t7_error failed
    end
end

function _t7_info
    set_color brcyan; and echo -n "t7util: "; and set_color cyan; and echo $argv; and set_color normal
end

function _t7_error
    set_color brred; and echo -n "t7util: "; and set_color red; and echo $argv; and set_color normal
end
