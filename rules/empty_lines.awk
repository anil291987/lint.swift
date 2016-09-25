#
# -----------------------------------------------------------------------------
#   Empty lines
#
#   You should not have too many lines around.
# -----------------------------------------------------------------------------
#
#
#
#


BEGIN {
    param_limit   = 2
    param_type    = "warning"
    param_id      = "empty_lines"
    param_message = "There are more than %d empty lines up here. (%s)"
}

/^$/ {
    empty++
    next
}

/^..*$/ {
    if ( empty > param_limit ) {
        print FILENAME ":" NR ": " param_type ": " \
            sprintf(param_message, param_limit, param_id)
    }
    empty=0
}