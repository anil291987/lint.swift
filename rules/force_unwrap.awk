#
# -----------------------------------------------------------------------------
#   Force unwrap
#
#   You should never force unwrap anything.
# -----------------------------------------------------------------------------
#
# optional!.method()

BEGIN {
    param_type      = "warning"
    param_id        = "force_unwrap"
    param_message   = "Force unwrapping should be avoided. (%s)"
}

/!\./ {
    print FILENAME ":" NR ": " param_type ": " \
        sprintf(param_message, param_id)
}