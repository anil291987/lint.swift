#
# -----------------------------------------------------------------------------
#   Missing docs
#
#   You should always document public code
# -----------------------------------------------------------------------------
#
# public var a: Int



BEGIN {
    param_type      = "warning"
    param_id        = "missing_docs"
    param_message   = "You should always document public code. (%s)"
}


!/\/\// && !/\*\// && !/open|public/ { missing = 1 }
(/\/\// || /\*\//) && !/open|public/ { missing = 0 }

/open|public/ {
    if ( missing == 1 ) {
        print FILENAME ":" NR ": " param_type ": " \
            sprintf(param_message, param_id)
    }
}

