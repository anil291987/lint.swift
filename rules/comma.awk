#
# -----------------------------------------------------------------------------
#   Comma
#
#   There should be no space before and one after comma
# -----------------------------------------------------------------------------
#
# func f(a:Int,b:Int) -> Int {}


BEGIN {
    param_type      = "warning"
    param_id        = "comma"
    param_message   = "There should be no space before and one after comma. (%s)"
}

/[[:space:]],[^[:space:]]/ || /[[:space:]],[[:space:]]/ || (/[^[:space:]],[^[:space:]]/ && !/[\"^[:space:]]*,[^[:space:]]*\"/ ) {
    print FILENAME ":" NR ": " param_type ": " \
        sprintf(param_message, param_id)
}







