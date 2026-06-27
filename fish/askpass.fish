#!/usr/bin/env fish

set -l argv_len (count "$argv")
if test $argv_len -ge 1
    set -l pass_name (
        echo "$argv[1]" \
        | grep -o "ssh/[^:' ]\+" \
        || return 1
    )

    # we have to redir to stderr to be able to see the message
    # otherwise ssh will misinterpret as the password for the ssh key
    printf "%s  Unlocking ssh key '$pass_name' using pass %s\n" \
        "$(set_color --bold yellow)" \
        "$(set_color normal)" \
        1>&2
    pass "$pass_name"
end
