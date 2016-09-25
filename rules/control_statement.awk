#
# -----------------------------------------------------------------------------
#   Control statement
#
#   You should NOT wrap control statements in parentheses
# -----------------------------------------------------------------------------
#
# func f(a:Int,b:Int) -> Int {}


BEGIN {
    param_type      = "warning"
    param_id        = "control_statement"
    param_message   = "You should not wrap control statements in parentheses. (%s)"
}

/[[:space:]]if[[:space:]]*\([a-zA-Z!]*\)|[[:space:]]if[[:space:]]*\(\(/ ||
/for[[:space:]]*\([^,{]*\)[[:space:]]*\{/ ||
/switch[[:space:]]*\([^,{]*\)[[:space:]]*\{/ ||
/guard[[:space:]]*\([^,{]*\)[[:space:]]*else[[:space:]]*\{/ ||
/while[[:space:]]*\([^,{]*\)[[:space:]]*\{/ {
    print FILENAME ":" NR ": " param_type ": " \
        sprintf(param_message, param_id)
}







