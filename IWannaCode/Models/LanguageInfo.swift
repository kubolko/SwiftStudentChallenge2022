// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let languageInfo = try? newJSONDecoder().decode(LanguageInfo.self, from: jsonData)

import Foundation

// MARK: - LanguageInfoElement
struct LanguageInfoElement: Codable, Identifiable {
    let headline, text: String
    let id = UUID().uuidString
}

typealias LanguageInfo = [LanguageInfoElement]
