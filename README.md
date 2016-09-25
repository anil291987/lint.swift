# lint.swift
The most simple linter for swift projects.

If you want to know more why I made this project, please read [this](https://theswiftdev.com/2016/09/25/linting-swift-code/).

## rules
The rules are based on the [SwiftLint](https://github.com/realm/SwiftLint) repository.

- catch
- closing_brace
- colon
- comma
- control_statement
- cyclomatic_complexity
- empty_comment_line
- empty_count
- empty_lines
- file_length
- force_cast
- force_try
- force_unwrap
- function_body_length
- function_parameter_count
- leading_whitespace
- legacy
- line_length
- mark
- missing_docs
- nil_coalesing
- opening_brace
- operator_whitespace
- private_outlet
- private_tests
- return_newline
- return_whitespace
- statement_position
- todo
- trailing_semicolon
- trailing_whitespace
- type_body_length
- type_name
- variable_name


## usage

- Clone or download this repo to your Xcode project source directory
- In Xcode add a new bash run script

```bash
sh "$SRCROOT"/lint.swift/lint

```

## todo
- better type and variable names checking with access level support
- trailing newline awk script instead of bash
- better documentation for rules


## License

WTFPL
