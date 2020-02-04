//
//  TextPrinter.swift
//

import Foundation

struct TextPrinter {

    let parser: Parser

    init(parser: Parser) {
        self.parser = parser
    }

    func report() {
        printTotals()
        printEachFile()
    }

    private func printTotals() {
        let totals = parser.regionsTotal()
        print("Total: \(totals.forPrinting)%")
    }

    private func printEachFile() {
        parser.fileTotals().forEach { (filename, percent) in
            print("\(filename): \(percent.forPrinting)%")
        }
    }
}
