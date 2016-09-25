#
# -----------------------------------------------------------------------------
#   Todo
#
#   These things should be fixed by now.
# -----------------------------------------------------------------------------
#
#
# // @todo: i should fix this later on.
# // @fixme: i should fix this later on.

BEGIN {
    param_limit   = 600
    param_type    = "warning"
    param_id      = "todo"
    param_message = "This should be checked: %s (%s)"
}

tolower($0) ~ /@todo|@fixme/ {
    print FILENAME ":" NR ": " param_type ": " \
        sprintf(param_message, $0, param_id)
}
