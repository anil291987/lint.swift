#
# -----------------------------------------------------------------------------
#   Trailing semicolon
#
#   Lines should NOT have trailing semicolons.
# -----------------------------------------------------------------------------
#
# let i = 0;

BEGIN {
    param_type      = "warning"
    param_id        = "trailing_semicolon"
    param_message   = "Trailing semicolons are not allowed. (%s)"
}


/;$/ {
    print FILENAME ":" NR ": " param_type ": " \
        sprintf(param_message, param_id)
}