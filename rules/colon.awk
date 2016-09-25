#
# -----------------------------------------------------------------------------
#   Colon
#
#   Colons should be next to the identifier.
# -----------------------------------------------------------------------------
#
# let a : Void?


BEGIN {
    param_type      = "warning"
    param_id        = "colon"
    param_message   = "Colons should be next to the identifier. (%s)"
}

/[[:space:]]+:[[:space:]]*/ && /func|var|let/ && !/[[:space:]]+\?[[:space:]]*/ {
    print FILENAME ":" NR ": " param_type ": " \
        sprintf(param_message, param_id)
}

