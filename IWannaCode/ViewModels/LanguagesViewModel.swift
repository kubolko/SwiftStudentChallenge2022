//
//  ViewModel.swift
//
//
//  Created by Jakub Sumionka on 19/04/2021.
//

import Foundation
import SwiftUI
import Combine

class ViewModel: ObservableObject {

    @Published var languages = Language()

    // MARK: Swift
    @Published var swiftInfo = LanguageInfo()
    @Published var swiftInterviewTips = InterviewTips()
    @Published var swiftCodingChallenges = CodingChallenges()

    // MARK: Python
    @Published var pythonInfo = LanguageInfo()
    @Published var pythonInterviewTips = InterviewTips()
    @Published var pythonCodingChallenges = CodingChallenges()

    // MARK: JavaScript
    @Published var javaScriptInfo = LanguageInfo()
    @Published var javaScriptInterviewTips = InterviewTips()
    @Published var javaScriptCodingChallenges = CodingChallenges()

//    func getLanugagesOld() {
//        guard let url = Bundle.main.url(forResource: "Languages", withExtension: "json")
//            else {
//                print("Json file not found")
//                return
//            }
//        let request = URLRequest(url: url)
//
//        URLSession.shared.dataTask(with: request) { data, _, error in
//            if error != nil {
//                print(error as Any)
//            }
//            if let data = data {
//                if let decodedresponse = try? JSONDecoder().decode(Language.self, from: data) {
//                    DispatchQueue.main.async {
//                        self.objectWillChange.send()
//                        self.languages.append(contentsOf: decodedresponse)
//                        print(self.languages.count)
//                    }
//
//                    return
//                }
//            }
//            print("error fetching the data \(String(describing: error?.localizedDescription))")
//        }.resume()
//    }
    func getLanugages() {
                    DispatchQueue.main.async {
                        self.objectWillChange.send()
                        let Swift = LanguageElement(name: "Swift", languageDescription: "Swift is easy to learn, modern, and veeery powerful. Right now it allows you to create an universal app, which will work from Apple Watch to Mac computer. Swift developers are really in need now, there are many iPhones and Macs needing their apps!", image: "Swift", colors: ["FBAF40", "FF3527"], font: "UIFont.systemFont(ofSize: 36, weight: UIFont.Weight.regular)", fontColor: "FFFFFF", isSemicolon: false, images: ["Swift1", "Swift2", "Swift3"], index: 0, buttonColor: "FFFFFF")
                        self.languages.append(Swift)
                        print(self.languages.count)
                    }
                }
    func getLanguageInfo(languageInfoFileName: String, language: String) {
        guard let url = Bundle.main.url(forResource: languageInfoFileName, withExtension: "json")else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let languageInfo = try? JSONDecoder().decode(LanguageInfo.self, from: data)

                        if language == "Swift" {
                            self.swiftInfo = languageInfo ?? [LanguageInfoElement(headline: "Error", text: "Error")]
                            print("Swift info loaded")
                            print(self.swiftInfo)
                        } else if language == "Python" {
                            self.pythonInfo = languageInfo ?? [LanguageInfoElement(headline: "Error", text: "Error")]
                            print("Python info loaded")
                       }
                        if language == "JavaScript" {
                            self.javaScriptInfo = languageInfo ?? [LanguageInfoElement(headline: "Error", text: "Error")]
                            print("Swift info loaded")
                        }
                    }
                }
            }
        dataTask.resume()
        }

    func getInterviewTips(interviewTipsFileName: String, language: String) {
        guard let url = Bundle.main.url(forResource: interviewTipsFileName, withExtension: "json")else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let interviewTips = try? JSONDecoder().decode(InterviewTips.self, from: data)

                        if language == "Swift" {
                            self.swiftInterviewTips = interviewTips!
                            print("Swift interview tips loaded")
                            print(self.swiftInterviewTips)
                        } else if language == "Python" {
                           self.pythonInterviewTips = interviewTips!
                            print("Python interview tips loaded")
                       }
                        if language == "JavaScript" {
                            self.javaScriptInterviewTips = interviewTips!
                            print("Swift interview tips loaded")
                        }
                    }
                }
            }
        dataTask.resume()
        }

    func getCodingChallenges(codingChallengesFileName: String, language: String) {
        guard let url = Bundle.main.url(forResource: codingChallengesFileName, withExtension: "json")else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let codingChallenges = try? JSONDecoder().decode(CodingChallenges.self, from: data)

                        if language == "Swift" {
                            self.swiftCodingChallenges = codingChallenges!
                            print("Swift coding challenges loaded")
                            print(self.swiftCodingChallenges)
                        } else if language == "Python" {
                            self.pythonCodingChallenges = codingChallenges!
                            print("Python coding challenges loaded")
                       } else if language == "JavaScript" {
                            self.javaScriptCodingChallenges = codingChallenges!
                            print("JavaScript coding challenges loaded")
                        }
                    }
                }
            }
        dataTask.resume()
        }

    func stringToColor(color: [String]) -> [Color] {
        var colors = [Color]()
        for i in color {
            let a = Color(hex: i)
            colors.append(a)
        }
        return colors
    }
}
//    func getLanguage(index: Int) -> LanguageElement{
//        let nextLanguage = languages[index]
//        return nextLanguage
//    }
