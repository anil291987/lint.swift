#
# -----------------------------------------------------------------------------
#   Operator whitespace
#
#   There should be a space before and after operators
# -----------------------------------------------------------------------------
#
# func f()->Int {}


BEGIN {
    param_type      = "warning"
    param_id        = "operator_whitespace"
    param_message   = "There should be a space before and after the return arrow. (%s)"
}

/func[[:space:]][[:space:]]+[\/\=\-\+\!\*\|\^\~\?\.%<>&]+/ ||
/func[[:space:]][\/\=\-\+\!\*\|\^\~\?\.%<>&]+[[:space:]][[:space:]]+/ ||
/func[[:space:]][\/\=\-\+\!\*\|\^\~\?\.%<>&]+[a-zA-Z\(]/ {
    print FILENAME ":" NR ": " param_type ": " \
        sprintf(param_message, param_id)
}







