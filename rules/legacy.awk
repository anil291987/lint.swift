#
# -----------------------------------------------------------------------------
#   Legacy
#
#   You should never use legacy code.
# -----------------------------------------------------------------------------
#
#
# All the things below are legacy code.

BEGIN {
    param_type    = "warning"
    param_id      = "legacy"
    param_message = "You should never use legacy code. (%s)"
}

/CGRectGetWidth|CGRectGetHeight|CGRectGetMinX|CGRectGetMidX|CGRectGetMaxX|CGRectGetMinY|CGRectGetMidY|CGRectGetMaxY|CGRectIsNull|CGRectIsEmpty|CGRectIsInfinite|CGRectStandardize|CGRectIntegral|CGRectInset|CGRectOffset|CGRectUnion|CGRectIntersection|CGRectContainsRect|CGRectContainsPoint|CGRectIntersectsRect|CGRectMake|CGPointMake|CGSizeMake|CGVectorMake|NSMakePoint|NSMakeSize|NSMakeRect|NSMakeRange|UIEdgeInsetsMake|NSEdgeInsetsMake|CGRectInfinite|CGPointZero|CGRectZero|CGSizeZero|NSZeroPoint|NSZeroRect|NSZeroSize|CGRectNull|NSWidth|NSHeight|NSMinX|NSMidX|NSMaxX|NSMinY|NSMidY|NSMaxY|NSEqualRects|NSEqualSizes|NSEqualPoints|NSEdgeInsetsEqual|NSIsEmptyRect|NSIntegralRect|NSInsetRect|NSOffsetRect|NSUnionRect|NSIntersectionRect|NSContainsRect|NSPointInRect|NSIntersectsRect/ {

    print FILENAME ":" NR ": " param_type ": " \
        sprintf(param_message, param_id)
}
