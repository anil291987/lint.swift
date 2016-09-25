#
# -----------------------------------------------------------------------------
#   Type Name
#
#   Types should have a valid name.
# -----------------------------------------------------------------------------
#
# class aaAAA {},
# struct _AAA {}
# private enum AAA_ {}
# class AA {}
# struct AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA {}

BEGIN {
    param_limit_min = 3
    param_limit_max = 40
    param_type      = "warning"
    param_id        = "type_name"
    param_message   = "Type name is invalid, min %d, max %d characters, format: /^[A-Z][A-Za-z]*/. (%s)"

    RS = "\n";
    FS = " ";
}

#todo: access levels!!!
/class|struct|enum/ {
    n=0
    for (i=1; i<=NF; i++) {

        if ( n == 1 ) {
            if ( $i != "func" && $i != "{" && ($i !~ /^[A-Z]/ ||
                length($i) < param_limit_min ||
                length($i) > param_limit_max) )
            {
                print FILENAME ":" NR ": " param_type ": " \
                    sprintf(param_message, param_limit_min, param_limit_max, param_id)
            }
            n=0
        }

        if ( $i == "class" || $i == "struct" || $i == "enum" ) {
            n=1
        }
    }
}

