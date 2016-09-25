#
# -----------------------------------------------------------------------------
#   Function body length
#
#   You should try to avoid long functions.
# -----------------------------------------------------------------------------
#
# func f() {
#     // ~ imagine a very long function body here ~
#     // ...
#     // ...
#     // ...
#     // ~ well, this is not so good ~
# }

BEGIN {
    param_limit   = 60
    param_type    = "warning"
    param_id      = "function_body_length"
    param_message = "This function has %d lines, but only %d lines are allowed. (%s)"


    RS = "\n"
    FS = ""
}


/[[:space:]]*func[[:space:]]+/ {
    if ( in_func == 0 ) {
        begin_line = NR
    }
    in_func = 1
}

{
    if ( in_func == 0 ) {
        next
    }
    for (i=1; i<=NF; i++) {
        if ($i == "{") {
            d++
        }
        else if ($i == "}") {
            d--
        }
    }
    if (d == 0) {
        numlines = NR - begin_line

        if ( numlines > param_limit ) {
            print FILENAME ":" begin_line ": " param_type ": " \
                sprintf(param_message, numlines, param_limit, param_id)

        }
        in_func = 0
    }
}
