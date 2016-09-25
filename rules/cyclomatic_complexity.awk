#
# -----------------------------------------------------------------------------
#   Cyclomatic complexity
#
#   You should always try to avoid the pyramid of doom.
# -----------------------------------------------------------------------------
#
# func f() {
#     if true {
#         if true {
#             if true {
#                 if true {
#                     if true {
#                         let a = 0
#                     }
#                 }
#             }
#         }
#     }
# }

BEGIN {
    param_limit   = 4
    param_type    = "warning"
    param_id      = "cyclomatic_complexity"
    param_message = "You have %d nested levels, but only %d levels are allowed. (%s)"

    RS = "\n"
    FS = ""
}

/[[:space:]]*func[[:space:]]+/ {
    if ( in_func == 0 ) {
        begin_line = 0
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

    if (d > param_limit+1) {
        if ( begin_line+1 != NR ) {
            print FILENAME ":" NR ": " param_type ": " \
                sprintf(param_message, d, param_limit, param_id)
        }
        begin_line = NR
    }
}
