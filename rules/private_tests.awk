#
# -----------------------------------------------------------------------------
#   Private tests
#
#   Tests should be never private.
# -----------------------------------------------------------------------------
#
# private func testSomething() {}
#


BEGIN {
    param_type    = "warning"
    param_id      = "private_tests"
    param_message = "Tests should be never private. (%s)"
}

/private/ && /XCTestCase/ || /private func test/ {
    print FILENAME ":" NR ": " param_type ": " \
        sprintf(param_message, param_id)
}





