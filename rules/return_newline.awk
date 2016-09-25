#
# -----------------------------------------------------------------------------
#   Return newline
#
#   Conditional statements should always return on the next line
# -----------------------------------------------------------------------------
#
# guard something else { return }


BEGIN {
    param_type      = "warning"
    param_id        = "return_newline"
    param_message   = "Conditional statements should always return on the next line. (%s)"
}

/(guard|if)[^\n]*return[^\n]\n*/ {
    print FILENAME ":" NR ": " param_type ": " \
        sprintf(param_message, param_id)
}
