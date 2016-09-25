#
# -----------------------------------------------------------------------------
#   Leading whitespace
#
#   Leading whitespaces are not allowed
# -----------------------------------------------------------------------------
#
#
#  // first line of the file

BEGIN {
    param_type      = "warning"
    param_id        = "leading_whitespace"
    param_message   = "Leading whitespaces are not allowed. (%s)"
}


/^$/ {
    if ( NR == 1 ) {
        print FILENAME ":" NR ": " param_type ": " \
            sprintf(param_message, param_id)
    }
}
