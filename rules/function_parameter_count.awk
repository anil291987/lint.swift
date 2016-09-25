#
# -----------------------------------------------------------------------------
#   Function Parameter Count
#
#   Too much function parameters are bad for your sight.
# -----------------------------------------------------------------------------
#
# func f(a: Int, b: Int, c: Int, d: Int, e: Int, f: Int = 1, g: Int) {
#
# }


BEGIN {
    param_limit   = 5
    param_type    = "warning"
    param_id      = "function_parameter_count"
    param_message = "This function has %d parameters, but only %d parameters are allowed. (%s)"

    RS = "\n"
    FS = ""
}

/[[:space:]]*func[[:space:]]+/ {
    line = NR
    in_func = 1
}

{
    if ( in_func == 0 ) {
        next
    }
    for (i=1; i<=NF; i++) {
        if ($i == "(") {
            d++
        }
        else if ($i == ")") {
            d--
        }
        if (d > 0) {
            if ( $i == "," ) {
                cnt++
            }
        }
    }
    if (d == 0) {
        if ( cnt+1 > param_limit ) {
            print FILENAME ":" line ": " param_type ": " \
                sprintf(param_message, cnt+1, param_limit, param_id)

        }
        in_func = 0
        cnt=0
    }
}
