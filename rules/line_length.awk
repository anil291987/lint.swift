#
# -----------------------------------------------------------------------------
#   Line length
#
#   Lines should have a character limit, but this is not the 80's, right? ;)
# -----------------------------------------------------------------------------
#
# // This line is too long...
# // Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Nullam quis risus eget urna mollis ornare vel eu leo.
#


BEGIN {
    param_limit   = 120
    param_type    = "warning"
    param_id      = "line_length"
    param_message = "This line has %d characters, but only %d characters are allowed. (%s)"
}

{
    if (length($0) > param_limit) {
        print FILENAME ":" NR ": " param_type ": " \
            sprintf(param_message, length($0), param_limit, param_id)
    }
}


