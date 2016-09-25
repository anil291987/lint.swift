#
# -----------------------------------------------------------------------------
#   Closing brace
#
#   Closing braces should not have any whitespaces in the middle.
# -----------------------------------------------------------------------------
#
# [].map({ } )


BEGIN {
    param_type      = "warning"
    param_id        = "closing_brace"
    param_message   = "Closing braces should not have any whitespaces in the middle. (%s)"
}

/\}[[:space:]]+\)/ {
    print FILENAME ":" NR ": " param_type ": " \
        sprintf(param_message, param_id)
}