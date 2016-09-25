#
# -----------------------------------------------------------------------------
#   Empty comment line
#
#   You should not use empty comment lines.
# -----------------------------------------------------------------------------
#
# //


BEGIN {
    param_ignored_lines = 7
    param_type          = "warning"
    param_id            = "empty_comment_line"
    param_message       = "You should not use empty comment lines. (%s)"
}

/^[[:space:]]*\/\/[[:space:]]*$/ {
    if ( NR > param_ignored_lines ) {
        print FILENAME ":" NR ": " param_type ": " \
            sprintf(param_message, param_id)
    }
}
