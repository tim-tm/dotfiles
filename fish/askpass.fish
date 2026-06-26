#!/usr/bin/env fish

set -l argv_len (count "$argv")
if test $argv_len -ge 1
    set -l pass_name (
        echo "$argv[1]" \
        | grep -o "ssh/[^:' ]\+" \
        || return 1
    )
    echo "Unlocking ssh key '$pass_name' using pass" 1>&2
    pass "$pass_name"
end
