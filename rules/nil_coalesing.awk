#
# -----------------------------------------------------------------------------
#   Colon
#
#   Nil coalesing
# -----------------------------------------------------------------------------
#
# optional ?? nil


BEGIN {
    param_type      = "warning"
    param_id        = "nil_coalesing"
    param_message   = "Nil coalesing. (%s)"
}

/\?\?[[:space:]]+nil/ {
    print FILENAME ":" NR ": " param_type ": " \
        sprintf(param_message, param_id)
}



