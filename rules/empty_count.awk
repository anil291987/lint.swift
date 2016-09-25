#
# -----------------------------------------------------------------------------
#   Empty count
#
#   You should use `isEmpty` instead of `count`.
# -----------------------------------------------------------------------------
#
# array.count == 0

BEGIN {
    param_type      = "warning"
    param_id        = "empty_count"
    param_message   = "You should use `isEmpty` instead of `count`. (%s)"
}

/count[[:space:]]*(==|!=|<|<=|>|>=)[[:space:]]*0/ {
    print FILENAME ":" NR ": " param_type ": " \
        sprintf(param_message, param_id)
}
