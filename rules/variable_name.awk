#
# -----------------------------------------------------------------------------
#   Variable name
#
#   Variables and constants should have valid names.
# -----------------------------------------------------------------------------
#
# let i = 0

BEGIN {
    param_limit_min = 3
    param_limit_max = 40
    param_type      = "warning"
    param_id        = "variable_name"
    param_message   = "Variable name is invalid, min %d, max %d characters, format: /^[A-Z][A-Za-z]*/. (%s)"

    RS = "\n";
    FS = " ";
}

/var|let/ {

    n=0
    for (i=1; i<=NF; i++) {

        if ( n == 1 ) {
            if ( $i != "func" && $i != "{" && ($i !~ /^[.a-zA-Z]/ ||
                length($i) < param_limit_min ||
                length($i) > param_limit_max) )
            {
                print FILENAME ":" NR ": " param_type ": " \
                    sprintf(param_message, param_limit_min, param_limit_max, param_id)
            }
            n=0
        }

        if ( $i == "var" || $i == "let" ) {
            n=1
        }
    }
}

