//
//  Parser.swift
//  

import Foundation

struct Parser {

    let data: CoverageData

    init?(filePath: String, fileManager: FileManager = FileManager.default) {
        guard let jsonData = fileManager.data(for: filePath) else { return nil }
        do {
            let decoded = try JSONDecoder().decode(CoverageDataRoot.self, from: jsonData)
            self.data = decoded.data[0]
        } catch {
            print("Decoding Error: \(error)")
            return nil
        }
    }

    func regionsTotal() -> Double {
        return data.totals.regions.percent
    }

    func fileTotals() -> [(String, Double)] {
        return data.files.map { ($0.filename, $0.summary.regions.percent) }
    }
}

// NOTE: Not all subdata is extracted at time of this writing, more work could be done to parse all the json fields.

struct CoverageDataRoot: Codable {
    let version: String
    let type: String
    let data: [CoverageData]
}

struct CoverageData: Codable {
    let totals: Totals
    let files: [File]
}

struct Totals: Codable {
    let regions: TotalDetail
    let lines: TotalDetail
    let instantiations: TotalDetail
    let functions: TotalDetail
}

struct TotalDetail: Codable {
    let percent: Double
    let covered: Int
    let count: Int
}

struct File: Codable {
    let summary: FileSummary
    let filename: String
}

struct FileSummary: Codable {
    let regions: TotalDetail
}

