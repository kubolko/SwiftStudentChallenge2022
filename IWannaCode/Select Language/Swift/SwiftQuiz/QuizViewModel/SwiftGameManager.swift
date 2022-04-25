//
//  GameManagerVM.swift
//  AKQuiz
//
//  Created by richa.e.srivastava on 16/11/2021.
//

import Foundation
import SwiftUI

class SwiftGameManagerVM: ObservableObject {

    static var currentIndex = 0

    static func createGameModel(i: Int) -> Quiz {
        return Quiz(currentQuestionIndex: i, quizModel: quizData[i])
    }

    @Published var model = SwiftGameManagerVM.createGameModel(i: SwiftGameManagerVM.currentIndex)
    @Published var roundOffset = CGFloat(0)

    init() {
        self.roundOffset = CGFloat(0)
    }

    func verifyAnswer(selectedOption: QuizOption) {
        for index in model.quizModel.optionsList.indices {
            model.quizModel.optionsList[index].isMatched = false
            model.quizModel.optionsList[index].isSelected = false

        }
        if let index = model.quizModel.optionsList.firstIndex(where: {$0.optionId == selectedOption.optionId}) {
            if selectedOption.optionId ==  model.quizModel.answer {
                model.quizModel.optionsList[index].isMatched = true
                model.quizModel.optionsList[index].isSelected = true

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    if SwiftGameManagerVM.currentIndex < SwiftGameManagerVM.quizData.count - 1 {
                        SwiftGameManagerVM.currentIndex = SwiftGameManagerVM.currentIndex + 1
                        self.model = SwiftGameManagerVM.createGameModel(i: SwiftGameManagerVM.currentIndex)
                        self.roundOffset += UIScreen.screenWidth/2/CGFloat(SwiftGameManagerVM.quizData.count)
                    } else {
                        self.model.quizCompleted = true
                        self.model.quizWinningStatus = true
                        self.roundOffset = CGFloat(0)
                    }
                }
            } else {
                model.quizModel.optionsList[index].isMatched = false
                model.quizModel.optionsList[index].isSelected = true
            }

        }
    }

    func restartGame() {
        SwiftGameManagerVM.currentIndex = 0
        model = SwiftGameManagerVM.createGameModel(i: SwiftGameManagerVM.currentIndex)
    }

}

extension SwiftGameManagerVM {
    static var quizData: [QuizModel] {
        [
            QuizModel(question: "What is the diffrence between class and struct?",
                      answer: "B",
                      optionsList: [QuizOption(id: 11, optionId: "A", option: "There isn't one", color: Color.yellow),
                                    QuizOption(id: 12, optionId: "B", option: "One is refrence type, one is value type", color: Color.red),
                                    QuizOption(id: 13, optionId: "C", option: "Class is older generation of struct", color: Color.green),
                                    QuizOption(id: 14, optionId: "D", option: "Class does not need initializers", color: Color.purple)]),

            QuizModel(question: "Can you change the value of let?",
                      answer: "C",
                      optionsList: [QuizOption(id: 21, optionId: "A", option: "Yes, with get{}", color: Color.yellow),
                                    QuizOption(id: 22, optionId: "B", option: "Yes, but only once", color: Color.red),
                                    QuizOption(id: 23, optionId: "C", option: "No, you can't", color: Color.green),
                                    QuizOption(id: 24, optionId: "D", option: "Yes, multiple times", color: Color.purple)]),

            QuizModel(question: "What to do in case you force unwrap the nil value?",
                      answer: "B",
                      optionsList: [QuizOption(id: 31, optionId: "A", option: "Don't need to do anything ", color: Color.yellow),
                                    QuizOption(id: 32, optionId: "B", option: "Provide defalut value and avoid force unwrapping", color: Color.red),
                                    QuizOption(id: 33, optionId: "C", option: "Make a refrence", color: Color.green),
                                    QuizOption(id: 34, optionId: "D", option: "Change the value of the variable", color: Color.purple)]),
            QuizModel(question: "Which is not a state of the app in iOS?",
                      answer: "B",
                      optionsList: [QuizOption(id: 31, optionId: "A", option: "Inactive", color: Color.yellow),
                                    QuizOption(id: 32, optionId: "B", option: "Loading", color: Color.red),
                                    QuizOption(id: 33, optionId: "C", option: "Active", color: Color.green),
                                    QuizOption(id: 34, optionId: "D", option: "Suspended", color: Color.purple)]),
            QuizModel(question: "Which is not a type in Swift",
                      answer: "A",
                      optionsList: [QuizOption(id: 31, optionId: "A", option: "EnumCase", color: Color.yellow),
                                    QuizOption(id: 32, optionId: "B", option: "Int", color: Color.red),
                                    QuizOption(id: 33, optionId: "C", option: "Image", color: Color.green),
                                    QuizOption(id: 34, optionId: "D", option: "[Enum]", color: Color.purple)]),
            QuizModel(question: "What does guard do in Swift?",
                      answer: "C",
                      optionsList: [QuizOption(id: 31, optionId: "A", option: "Takes care about the memory leaks", color: Color.yellow),
                                    QuizOption(id: 32, optionId: "B", option: "He makes API requests secure", color: Color.red),
                                    QuizOption(id: 33, optionId: "C", option: "He tries to keep the loop and other conditions safe", color: Color.green),
                                    QuizOption(id: 34, optionId: "D", option: "He focuses on making Web Content safe", color: Color.purple)]),
            QuizModel(question: "What does NS mean in NSArray?",
                      answer: "A",
                      optionsList: [QuizOption(id: 31, optionId: "A", option: "Next Step", color: Color.yellow),
                                    QuizOption(id: 32, optionId: "B", option: "Non Stop", color: Color.red),
                                    QuizOption(id: 33, optionId: "C", option: "Not Safe", color: Color.green),
                                    QuizOption(id: 34, optionId: "D", option: "Non Numeric", color: Color.purple)]),
            QuizModel(question: "Whay is it better introduce design pattern in your app? (MVVM, MVP)",
                      answer: "D",
                      optionsList: [QuizOption(id: 31, optionId: "A", option: "It's just a fad", color: Color.yellow),
                                    QuizOption(id: 32, optionId: "B", option: "It will work faster", color: Color.red),
                                    QuizOption(id: 33, optionId: "C", option: "It will not be published in the app store if I won't do it", color: Color.green),
                                    QuizOption(id: 34, optionId: "D", option: "The app will be better documented and I'll have less technical debt", color: Color.purple)]),
            QuizModel(question: "What is memory leak?",
                      answer: "D",
                      optionsList: [QuizOption(id: 31, optionId: "A", option: "It's when app uses another's app memory", color: Color.yellow),
                                    QuizOption(id: 32, optionId: "B", option: "It happens when I don't heve enough memory on the device", color: Color.red),
                                    QuizOption(id: 33, optionId: "C", option: "It is aging of the phone and lower performance due to that", color: Color.green),
                                    QuizOption(id: 34, optionId: "D", option: "It's when memory in our phone starts to be taken by the things we don't need there", color: Color.purple)]),
            QuizModel(question: "What is the minimum iOS version supporting SwiftUI",
                      answer: "B",
                      optionsList: [QuizOption(id: 31, optionId: "A", option: "12", color: Color.yellow),
                                    QuizOption(id: 32, optionId: "B", option: "13", color: Color.red),
                                    QuizOption(id: 33, optionId: "C", option: "14", color: Color.green),
                                    QuizOption(id: 34, optionId: "D", option: "Other", color: Color.purple)])

        ]
    }
}
