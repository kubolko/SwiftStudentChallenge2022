//
//  GameManagerVM.swift
//  AKQuiz
//
//  Created by richa.e.srivastava on 16/11/2021.
//

import Foundation
import SwiftUI

class PythonGameManagerVM: ObservableObject {

    static var currentIndex = 0

    static func createGameModel(i: Int) -> Quiz {
        return Quiz(currentQuestionIndex: i, quizModel: quizData[i])
    }

    @Published var model = PythonGameManagerVM.createGameModel(i: PythonGameManagerVM.currentIndex)
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
                    if PythonGameManagerVM.currentIndex < PythonGameManagerVM.quizData.count - 1 {
                        PythonGameManagerVM.currentIndex = PythonGameManagerVM.currentIndex + 1
                        self.model = PythonGameManagerVM.createGameModel(i: PythonGameManagerVM.currentIndex)
                        self.roundOffset += UIScreen.screenWidth/2/CGFloat(PythonGameManagerVM.quizData.count)
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
        PythonGameManagerVM.currentIndex = 0
        model = PythonGameManagerVM.createGameModel(i: PythonGameManagerVM.currentIndex)
    }

}

extension PythonGameManagerVM {
    static var quizData: [QuizModel] {
        [
            QuizModel(question: "Which is the correct answer?",
                      answer: "B",
                      optionsList: [QuizOption(id: 11, optionId: "A", option: "Python is compiled language", color: Color.yellow),
                                    QuizOption(id: 12, optionId: "B", option: "Python is interpreted language", color: Color.red),
                                    QuizOption(id: 13, optionId: "C", option: "Python is hybrid language", color: Color.green),
                                    QuizOption(id: 14, optionId: "D", option: "Python is synthesized language", color: Color.purple)]),
            QuizModel(question: "List",
                      answer: "C",
                      optionsList: [QuizOption(id: 21, optionId: "A", option: "Is faster than tuple", color: Color.yellow),
                                    QuizOption(id: 22, optionId: "B", option: "Is not mutable", color: Color.red),
                                    QuizOption(id: 23, optionId: "C", option: "Is mutable", color: Color.green),
                                    QuizOption(id: 24, optionId: "D", option: "Needs init", color: Color.purple)]),
            QuizModel(question: "What is PEP-8?",
                      answer: "A",
                      optionsList: [QuizOption(id: 31, optionId: "A", option: "Python Enhancement Proposal", color: Color.yellow),
                                    QuizOption(id: 32, optionId: "B", option: "Library", color: Color.red),
                                    QuizOption(id: 33, optionId: "C", option: "Commit", color: Color.green),
                                    QuizOption(id: 34, optionId: "D", option: "Code speed bechmark", color: Color.purple)]),
            QuizModel(question: "Which is not true?",
                      answer: "D",
                      optionsList: [QuizOption(id: 31, optionId: "A", option: "Python is open source", color: Color.yellow),
                                    QuizOption(id: 32, optionId: "B", option: "Python is dynamically typed", color: Color.red),
                                    QuizOption(id: 33, optionId: "C", option: "Python has a lot of libraires", color: Color.green),
                                    QuizOption(id: 34, optionId: "D", option: "Python can run only on Windows", color: Color.purple)]),
            QuizModel(question: "Which is not a namespace type in Python?",
                      answer: "D",
                      optionsList: [QuizOption(id: 31, optionId: "A", option: "Built-in namespace", color: Color.yellow),
                                    QuizOption(id: 32, optionId: "B", option: "Enclosing namespaces", color: Color.red),
                                    QuizOption(id: 33, optionId: "C", option: "Local namespaces", color: Color.green),
                                    QuizOption(id: 34, optionId: "D", option: "Framework namespaces", color: Color.purple)]),
            QuizModel(question: "What is the difference between .py and .pyc files?",
                      answer: "C",
                      optionsList: [QuizOption(id: 31, optionId: "A", option: "One is for debugging", color: Color.yellow),
                                    QuizOption(id: 32, optionId: "B", option: "One contains metadata", color: Color.red),
                                    QuizOption(id: 33, optionId: "C", option: "One contains code, one bytecode of it", color: Color.green),
                                    QuizOption(id: 34, optionId: "D", option: "One is code, one is for databases", color: Color.purple)]),
            QuizModel(question: "Which is not a Python keyword?",
                      answer: "C",
                      optionsList: [QuizOption(id: 31, optionId: "A", option: "For", color: Color.yellow),
                                    QuizOption(id: 32, optionId: "B", option: "Try", color: Color.red),
                                    QuizOption(id: 33, optionId: "C", option: "Guard", color: Color.green),
                                    QuizOption(id: 34, optionId: "D", option: "While", color: Color.purple)]),
            QuizModel(question: "What you can do with public variable?",
                      answer: "A",
                      optionsList: [QuizOption(id: 31, optionId: "A", option: "Acess it from other file", color: Color.yellow),
                                    QuizOption(id: 32, optionId: "B", option: "Change its name in file editor", color: Color.red),
                                    QuizOption(id: 33, optionId: "C", option: "Change the type of it any time with any function", color: Color.green),
                                    QuizOption(id: 34, optionId: "D", option: "Delete it safely from memory", color: Color.purple)]),
            QuizModel(question: "What does [::-1] do?",
                      answer: "A",
                      optionsList: [QuizOption(id: 31, optionId: "A", option: "Reverses array", color: Color.yellow),
                                    QuizOption(id: 32, optionId: "B", option: "Acceses first element of the array", color: Color.red),
                                    QuizOption(id: 33, optionId: "C", option: "Selects first row in pandas", color: Color.green),
                                    QuizOption(id: 34, optionId: "D", option: "Loads the value of the array", color: Color.purple)]),
            QuizModel(question: "How do you write comments in Python?",
                      answer: "B",
                      optionsList: [QuizOption(id: 31, optionId: "A", option: "With //", color: Color.yellow),
                                    QuizOption(id: 32, optionId: "B", option: "With #", color: Color.red),
                                    QuizOption(id: 33, optionId: "C", option: "With <", color: Color.green),
                                    QuizOption(id: 34, optionId: "D", option: "With %%", color: Color.purple)])
        ]
    }
}
