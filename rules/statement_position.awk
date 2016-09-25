#
# -----------------------------------------------------------------------------
#   Statement position
#
#   Stroustrup style ftw!
# -----------------------------------------------------------------------------
#
# if true {
#
# } else {
#
# }

BEGIN {
    param_type      = "warning"
    param_id        = "statement_position"
    param_message   = "Statement should be in a new line. (%s)"
}

/} else/ || /} catch/ {

    print FILENAME ":" NR ": " param_type ": " \
        sprintf(param_message, param_id)
}