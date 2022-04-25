// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let language = try? newJSONDecoder().decode(Language.self, from: jsonData)

import Foundation

// MARK: - LanguageElement
struct LanguageElement: Codable, Hashable, Identifiable {
    let name, languageDescription, image: String
    let colors: [String]
    let font, fontColor: String
    let isSemicolon: Bool
    let images: [String]
    let index: Int
    let buttonColor: String
    let id = UUID()

    enum CodingKeys: String, CodingKey {
        case name
        case languageDescription = "description"
        case image, colors, font, fontColor, isSemicolon, images, index, buttonColor
    }
}

typealias Language = [LanguageElement]

// MARK: - LanguageInfo
