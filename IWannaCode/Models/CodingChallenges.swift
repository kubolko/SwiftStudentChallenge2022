// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let codingChallenges = try? newJSONDecoder().decode(CodingChallenges.self, from: jsonData)

import Foundation

// MARK: - CodingChallenges
struct CodingChallenges: Codable, Identifiable {
    let easy: [Challenge]
    let intermediate: [Challenge]
    let hard: [Challenge]
    let id = UUID()

    init() {
        self.easy = [Challenge]()
        self.intermediate = [Challenge]()
        self.hard = [Challenge]()
    }
}

// MARK: - Easy
struct Challenge: Codable, Identifiable {
    let id: Int
    let text: String
}
