
// TODO: Look in to argument parsing and add some flexibility and help string

// Usage: swift-codecov /path/to/coverage/file.json

import Foundation

var arguments = CommandLine.arguments

let filePath = arguments[1]
guard let parser = Parser(filePath: filePath) else {
    print("Missing file \(filePath)")
    exit(EXIT_FAILURE)
}

let printer = TextPrinter(parser: parser)
printer.report()
