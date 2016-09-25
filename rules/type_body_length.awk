#
# -----------------------------------------------------------------------------
#   Type Body Length
#
#   Classes, structs, enums should not be too long.
# -----------------------------------------------------------------------------
#
# class A() {
#     // ~ imagine a very long class, struct, enum here ~
#     // ...
#     // ...
#     // ...
#     // ~ well, this is not so good ~
# }

BEGIN {
    param_limit   = 240
    param_type    = "warning"
    param_id      = "type_body_length"
    param_message = "This type has %d lines, but only %d lines are allowed. (%s)"

    RS = "\n"
    FS = ""
}

/[[:space:]]*class|struct|enum[[:space:]]+/ {
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
