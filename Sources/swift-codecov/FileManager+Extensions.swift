//
//  FileManager+Extension.swift
//  
//

import Foundation

extension FileManager {
    func data(for path: String) -> Data? {
        let expandedPath: String = NSString(string: path).expandingTildeInPath as String
        guard fileExists(atPath: expandedPath) else { return nil }

        let fileURL = URL(fileURLWithPath: path)

        do {
            let fileData = try Data(contentsOf: fileURL)
            return fileData
        } catch {
            print("Error getting data from file \(error)")
            return nil
        }
    }
}
