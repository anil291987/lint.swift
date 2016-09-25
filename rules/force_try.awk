#
# -----------------------------------------------------------------------------
#   Force try
#
#   You should never force try!
# -----------------------------------------------------------------------------
#
# try! call()

BEGIN {
    param_type      = "warning"
    param_id        = "force_try"
    param_message   = "Force tries should be avoided. (%s)"
}

/try!/ {
    print FILENAME ":" NR ": " param_type ": " \
        sprintf(param_message, param_id)
}







