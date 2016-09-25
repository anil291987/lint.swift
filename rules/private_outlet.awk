#
# -----------------------------------------------------------------------------
#   Private outlet
#
#   IBOutlets should be always private.
# -----------------------------------------------------------------------------
#
# @IBOutlet weak var textLabel!
#


BEGIN {
    param_type    = "warning"
    param_id      = "private_outlet"
    param_message = "IBOutlets should be always private. (%s)"
}

/@IBOutlet/ && !/private/ {
    print FILENAME ":" NR ": " param_type ": " \
        sprintf(param_message, param_id)
}

