// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let interviewTips = try? newJSONDecoder().decode(InterviewTips.self, from: jsonData)

import Foundation
import CloudKit

// MARK: - InterviewTips
struct InterviewTips: Codable, Identifiable {
    let beforeYouSendCV: [Before]
    let beforeRecruitingTask: [Before]
    let beforeYourFirstDay: [Before]
    let id = UUID()

    init() {
        self.beforeYouSendCV = [Before]()
        self.beforeRecruitingTask = [Before]()
        self.beforeYourFirstDay = [Before]()
    }
}

// MARK: - Before
struct Before: Codable, Identifiable {
    let id: Int
    let text: String
}
