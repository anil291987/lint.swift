#
# -----------------------------------------------------------------------------
#   File length
#
#   Files should not grow too big.
# -----------------------------------------------------------------------------
#
#
# // ~ imagine a very long file here ~
# // ...
# // ...
# // ...
# // ~ well, this is not so good ~

BEGIN {
    param_limit   = 600
    param_type    = "warning"
    param_id      = "file_length"
    param_message = "This file has %d lines, but only %d lines are allowed. (%s)"
}

END {
    if ( NR > param_limit ) {
        print FILENAME ":" NR ": " param_type ": " \
            sprintf(param_message, NR, param_limit, param_id)
    }

}