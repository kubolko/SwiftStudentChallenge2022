//
//  MotherView.swift
//  NavigatinInSwiftUIStarter
//
//  Created by Andreas Schultz on 29.10.20.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var viewRouter: ViewRouter
    @ObservedObject var viewModel = ViewModel()

    var body: some View {
        switch viewRouter.currentPage {
        case .welcome:
            WelcomeView(viewModel: viewModel)
                .onAppear(perform: {viewModel.getLanugages()
                })

            // MARK: Swift
        case .chooseSwift:
            ChooseSwift(viewModel: viewModel)
        case .swiftMenu:
            SwiftMenu(language: LanguageElement(name: "Swift", languageDescription: "Swift is easy to learn, modern, and veeery powerful. Right now it allows you to create an universal app, which will work from Apple Watch to Mac computer. Swift developers are really in need now, there are many iPhones and Macs needing their apps!", image: "Swift", colors: ["FBAF40", "FF3527"], font: "UIFont.systemFont(ofSize: 36, weight: UIFont.Weight.regular)", fontColor: "FFFFFF", isSemicolon: false, images: ["Swift1", "Swift2", "Swift3"], index: 0, buttonColor: "FFFFFF"), viewModel: viewModel)
        case .swiftInfo:
            SwiftInfo(language: LanguageElement(name: "Swift", languageDescription: "Swift is easy to learn, modern, and veeery powerful. Right now it allows you to create an universal app, which will work from Apple Watch to Mac computer. Swift developers are really in need now, there are many iPhones and Macs needing their apps!", image: "Swift", colors: ["FBAF40", "FF3527"], font: "UIFont.systemFont(ofSize: 36, weight: UIFont.Weight.regular)", fontColor: "FFFFFF", isSemicolon: false, images: ["Swift1", "Swift2", "Swift3"], index: 0, buttonColor: "FFFFFF"), viewModel: viewModel)
        case .swiftInterviewTips:
            SwiftInterviewTips(viewModel: viewModel, language: LanguageElement(name: "Swift", languageDescription: "Swift is easy to learn, modern, and veeery powerful. Right now it allows you to create an universal app, which will work from Apple Watch to Mac computer. Swift developers are really in need now, there are many iPhones and Macs needing their apps!", image: "Swift", colors: ["FBAF40", "FF3527"], font: "UIFont.systemFont(ofSize: 36, weight: UIFont.Weight.regular)", fontColor: "FFFFFF", isSemicolon: false, images: ["Swift1", "Swift2", "Swift3"], index: 0, buttonColor: "FFFFFF"))
        case .swiftCodingChallenge:
            SwiftCodingChallenges(viewModel: viewModel, language: LanguageElement(name: "Swift", languageDescription: "Swift is easy to learn, modern, and veeery powerful. Right now it allows you to create an universal app, which will work from Apple Watch to Mac computer. Swift developers are really in need now, there are many iPhones and Macs needing their apps!", image: "Swift", colors: ["FBAF40", "FF3527"], font: "UIFont.systemFont(ofSize: 36, weight: UIFont.Weight.regular)", fontColor: "FFFFFF", isSemicolon: false, images: ["Swift1", "Swift2", "Swift3"], index: 0, buttonColor: "FFFFFF"))
        case .swiftQuiz:
            SwiftQuizView(viewRouter: viewRouter, language: LanguageElement(name: "Swift", languageDescription: "Swift is easy to learn, modern, and veeery powerful. Right now it allows you to create an universal app, which will work from Apple Watch to Mac computer. Swift developers are really in need now, there are many iPhones and Macs needing their apps!", image: "Swift", colors: ["FBAF40", "FF3527"], font: "UIFont.systemFont(ofSize: 36, weight: UIFont.Weight.regular)", fontColor: "FFFFFF", isSemicolon: false, images: ["Swift1", "Swift2", "Swift3"], index: 0, buttonColor: "FFFFFF"))

            // MARK: Python
        case .choosePython:
            ChoosePython(viewModel: viewModel)
        case .pythonMenu:
            PythonMenu(language: LanguageElement(name: "Python", languageDescription: "Python is simple. Many people choose it as first language, but don’t think, that you won’t be able to create amazing things with it! Data analysis, visualisation, or web development are python key strenghts.", image: "Python", colors: ["36587E", "253E58"], font: "Menlo-Regular", fontColor: "FFFFFF", isSemicolon: false, images: ["Python1", "Python2", "Python3"], index: 2, buttonColor: "FFFFFF"), viewModel: viewModel)
        case .pythonInfo:
                        PythonInfo(language: LanguageElement(name: "Python", languageDescription: "Python is simple. Many people choose it as first language, but don’t think, that you won’t be able to create amazing things with it! Data analysis, visualisation, or web development are python key strenghts.", image: "Python", colors: ["36587E", "253E58"], font: "Menlo-Regular", fontColor: "FFFFFF", isSemicolon: false, images: ["Python1", "Python2", "Python3"], index: 2, buttonColor: "FFFFFF"), viewModel: viewModel)
        case .pythonInterviewTips:
            PythonInterviewTips(viewModel: viewModel, language: LanguageElement(name: "Python", languageDescription: "Python is simple. Many people choose it as first language, but don’t think, that you won’t be able to create amazing things with it! Data analysis, visualisation, or web development are python key strenghts.", image: "Python", colors: ["36587E", "253E58"], font: "Menlo-Regular", fontColor: "FFFFFF", isSemicolon: false, images: ["Python1", "Python2", "Python3"], index: 2, buttonColor: "FFFFFF"))
        case .pythonCodingChallenge:
            PythonCodingChallenge(viewModel: viewModel, language: LanguageElement(name: "Python", languageDescription: "Python is simple. Many people choose it as first language, but don’t think, that you won’t be able to create amazing things with it! Data analysis, visualisation, or web development are python key strenghts.", image: "Python", colors: ["36587E", "253E58"], font: "Menlo-Regular", fontColor: "FFFFFF", isSemicolon: false, images: ["Python1", "Python2", "Python3"], index: 2, buttonColor: "FFFFFF"))
        case .pythonQuiz:
            PythonQuizView(viewModel: viewModel, language: LanguageElement(name: "Python", languageDescription: "Python is simple. Many people choose it as first language, but don’t think, that you won’t be able to create amazing things with it! Data analysis, visualisation, or web development are python key strenghts.", image: "Python", colors: ["36587E", "253E58"], font: "Menlo-Regular", fontColor: "FFFFFF", isSemicolon: false, images: ["Python1", "Python2", "Python3"], index: 2, buttonColor: "FFFFFF"))

            // MARK: Java Script
        case .chooseJavaScript:
            ChooseJavaScript(viewModel: viewModel)
        case .javaScriptMenu:
            JavaScriptMenu(language: LanguageElement(name: "JavaScript", languageDescription: "Wanna make a full-fletched website? JavaScript is the way to go! Throughout the years it has evolved and become the default scripting language for modern web sites! ", image: "JavaScript", colors: ["F1F1F1", "E4E4E4"], font: "ArialMT", fontColor: "000000", isSemicolon: true, images: ["JavaScript1", "JavaScript2", "JavaScript3"], index: 2, buttonColor: "F7DF1E"), viewModel: viewModel)
        case .javaScriptInfo:
            JavaScriptInfo(language: LanguageElement(name: "JavaScript", languageDescription: "Wanna make a full-fletched website? JavaScript is the way to go! Throughout the years it has evolved and become the default scripting language for modern web sites! ", image: "JavaScript", colors: ["F1F1F1", "E4E4E4"], font: "ArialMT", fontColor: "000000", isSemicolon: true, images: ["JavaScript1", "JavaScript2", "JavaScript3"], index: 2, buttonColor: "F7DF1E"), viewModel: viewModel)
        case .javaScriptInterviewTips:
            JavaScriptInterviewTips(viewModel: viewModel, language: LanguageElement(name: "JavaScript", languageDescription: "Wanna make a full-fletched website? JavaScript is the way to go! Throughout the years it has evolved and become the default scripting language for modern web sites! ", image: "JavaScript", colors: ["F1F1F1", "E4E4E4"], font: "ArialMT", fontColor: "000000", isSemicolon: true, images: ["JavaScript1", "JavaScript2", "JavaScript3"], index: 2, buttonColor: "F7DF1E"))
        case .javaScriptCodingChallenge:
            JavaScriptCodingChallenge(viewModel: viewModel, language: LanguageElement(name: "JavaScript", languageDescription: "Wanna make a full-fletched website? JavaScript is the way to go! Throughout the years it has evolved and become the default scripting language for modern web sites! ", image: "JavaScript", colors: ["F1F1F1", "E4E4E4"], font: "ArialMT", fontColor: "000000", isSemicolon: true, images: ["JavaScript1", "JavaScript2", "JavaScript3"], index: 2, buttonColor: "F7DF1E"))
        case .javaScriptQuiz:
            JavaScriptQuizView(viewModel: viewModel, language: LanguageElement(name: "JavaScript", languageDescription: "Wanna make a full-fletched website? JavaScript is the way to go! Throughout the years it has evolved and become the default scripting language for modern web sites! ", image: "JavaScript", colors: ["F1F1F1", "E4E4E4"], font: "ArialMT", fontColor: "000000", isSemicolon: true, images: ["JavaScript1", "JavaScript2", "JavaScript3"], index: 2, buttonColor: "F7DF1E"))
        }
    }
}
