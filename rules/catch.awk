#
# -----------------------------------------------------------------------------
#   Catch
#
#   You should not create an explicit error property.
# -----------------------------------------------------------------------------
#
# do  {
#
# } catch (let error) {
#
# }

BEGIN {
    param_type      = "warning"
    param_id        = "catch"
    param_message   = "Catch already has a default error. (%s)"
}

/catch \(let error\) \{/ || /catch let error \{/ {
    print FILENAME ":" NR ": " param_type ": " \
        sprintf(param_message, param_id)
}