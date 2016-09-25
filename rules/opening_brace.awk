#
# -----------------------------------------------------------------------------
#   Opening brace
#
#   There should be a space before opening braces
# -----------------------------------------------------------------------------
#
# func f(){}


BEGIN {
    param_type      = "warning"
    param_id        = "opening_brace"
    param_message   = "There should be a space before opening braces. (%s)"
}

/([^( ]|[\s(][\s]+)\{/ {
    print FILENAME ":" NR ": " param_type ": " \
        sprintf(param_message, param_id)
}