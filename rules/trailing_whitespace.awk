#
# -----------------------------------------------------------------------------
#   Trailing whitespace
#
#   Lines should NOT have trailing whitespaces.
# -----------------------------------------------------------------------------
#
# let i = 0

BEGIN {
    param_type      = "warning"
    param_id        = "trailing_whitespace"
    param_message   = "Trailing whitespaces are not allowed. (%s)"
}



{
    t=length($0)
    sub(" *$","")
    if ( t-length($0) > 0 ) {
        print FILENAME ":" NR ": " param_type ": " \
            sprintf(param_message, param_id)
    }
}
