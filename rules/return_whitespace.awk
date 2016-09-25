#
# -----------------------------------------------------------------------------
#   Return whitespace
#
#   There should be a space before and after the return arrow
# -----------------------------------------------------------------------------
#
# func f()->Int {}


BEGIN {
    param_type      = "warning"
    param_id        = "return_whitespace"
    param_message   = "There should be a space before and after the return arrow. (%s)"
}

/\)((([ \f\r\t]{0}|[ \f\r\t]{2,})\->[ \f\r\t]*)|([ \f\r\t]\->([ \f\r\t]{0}|[ \f\r\t]{2,}))|\n[ \f\r\t]*\->([ \f\r\t]{0}|[ \f\r\t]{2,})|([ \f\r\t]{0}|[ \f\r\t]{2,})\->\n[ \f\r\t]*)[^[:space:]]+/ {
    print FILENAME ":" NR ": " param_type ": " \
        sprintf(param_message, param_id)
}







