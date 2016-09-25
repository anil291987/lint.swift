#
# -----------------------------------------------------------------------------
#   Force cast
#
#   You should never force cast anything.
# -----------------------------------------------------------------------------
#
# optional as! Int

BEGIN {
    param_type      = "warning"
    param_id        = "force_cast"
    param_message   = "Force casts should be avoided. (%s)"
}

/as!/ {
    print FILENAME ":" NR ": " param_type ": " \
        sprintf(param_message, param_id)
}