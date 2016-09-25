#
# -----------------------------------------------------------------------------
#   Mark
#
#   Marks should have a valid format
# -----------------------------------------------------------------------------
#
#
#  // first line of the file

BEGIN {
    param_type      = "warning"
    param_id        = "mark"
    param_message   = "Marks should have a valid format. (%s)"
}



/MARK:[^[:space:]]|[^[:space:]]MARK: [^-]|[[:space:]]MARK:[^[:space:]]|MARK:[[:space:]][-][^\\s ]/ {
    print FILENAME ":" NR ": " param_type ": " \
        sprintf(param_message, param_id)
}


