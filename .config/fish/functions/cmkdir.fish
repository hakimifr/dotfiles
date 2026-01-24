function cmkdir
    mkdir -p $argv
    if test $status -ne 0
        sudo mkdir -p $argv
    end

    if test $status -eq 0
        cd $argv
    end
end
