//
//  GameManagerVM.swift
//  AKQuiz
//
//  Created by richa.e.srivastava on 16/11/2021.
//

import Foundation
import SwiftUI

class JavaScriptGameManagerVM: ObservableObject {

    static var currentIndex = 0

    static func createGameModel(i: Int) -> Quiz {
        return Quiz(currentQuestionIndex: i, quizModel: quizData[i])
    }

    @Published var model = JavaScriptGameManagerVM.createGameModel(i: JavaScriptGameManagerVM.currentIndex)
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
                    if JavaScriptGameManagerVM.currentIndex < JavaScriptGameManagerVM.quizData.count - 1 {
                        JavaScriptGameManagerVM.currentIndex = JavaScriptGameManagerVM.currentIndex + 1
                        self.model = JavaScriptGameManagerVM.createGameModel(i: JavaScriptGameManagerVM.currentIndex)
                        self.roundOffset += UIScreen.screenWidth/2/CGFloat(JavaScriptGameManagerVM.quizData.count)
                    } else {
                        self.model.quizCompleted = true
                        self.model.quizWinningStatus = true
                        self.roundOffset = CGFloat(0)
                    }
                }
            } else {
                model.quizModel.optionsList[index].isMatched = false
                model.quizModel.optionsList[index].isSelected = true
                //MARK: Ticket 6
//                model.quizWinningStatus = false
            }

        }
    }

    func restartGame() {
        JavaScriptGameManagerVM.currentIndex = 0
        model = JavaScriptGameManagerVM.createGameModel(i: JavaScriptGameManagerVM.currentIndex)
    }

}

extension JavaScriptGameManagerVM {
    static var quizData: [QuizModel] {
        [
            QuizModel(question: "Can you make something diffrent than website with JavaScript?",
                      answer: "B",
                      optionsList: [QuizOption(id: 11, optionId: "A", option: "No", color: Color.yellow),
                                    QuizOption(id: 12, optionId: "B", option: "Yes, mobile app, backend and much more...", color: Color.red),
                                    QuizOption(id: 13, optionId: "C", option: "Yes, machine learning", color: Color.green),
                                    QuizOption(id: 14, optionId: "D", option: "Yes, embedded solutions", color: Color.purple)]),
            QuizModel(question: "Inside which HTML element do we put the JavaScript?",
                      answer: "A",
                      optionsList: [QuizOption(id: 21, optionId: "A", option: "<script>", color: Color.yellow),
                                    QuizOption(id: 22, optionId: "B", option: "<javascript>", color: Color.red),
                                    QuizOption(id: 23, optionId: "C", option: "<scripting>", color: Color.green),
                                    QuizOption(id: 24, optionId: "D", option: "<js>", color: Color.purple)]),
            QuizModel(question: "What is the correct JavaScript syntax to change the content of the HTML element below? \n <p id='demo'>This is a demonstration.</p>",
                      answer: "B",
                      optionsList: [QuizOption(id: 31, optionId: "A", option: "#demo.innerHTML = 'Hello World!'", color: Color.yellow),
                                    QuizOption(id: 32, optionId: "B", option: "document.getElementById('demo').innerHTML = 'Hello World!';", color: Color.red),
                                    QuizOption(id: 33, optionId: "C", option: "document.getElementByName('p').innerHTML = 'Hello World!';", color: Color.green),
                                    QuizOption(id: 34, optionId: "D", option: "document.getElement('p').innerHTML = 'Hello World!';", color: Color.purple)]),
            QuizModel(question: "Where is the correct place to insert a JavaScript?",
                      answer: "D",
                      optionsList: [QuizOption(id: 31, optionId: "A", option: "", color: Color.yellow),
                                    QuizOption(id: 32, optionId: "B", option: "The <head> section", color: Color.red),
                                    QuizOption(id: 33, optionId: "C", option: "The <body> section", color: Color.green),
                                    QuizOption(id: 34, optionId: "D", option: "Both answers are correct", color: Color.purple)]),
            QuizModel(question: "What is the correct syntax for referring to an external script called 'xxx.js'?",
                      answer: "B",
                      optionsList: [QuizOption(id: 31, optionId: "A", option: "", color: Color.yellow),
                                    QuizOption(id: 32, optionId: "B", option: "<script src='xxx.js'>", color: Color.red),
                                    QuizOption(id: 33, optionId: "C", option: "<script href='xxx.js'>", color: Color.green),
                                    QuizOption(id: 34, optionId: "D", option: "<script name='xxx.js'>t", color: Color.purple)]),
            QuizModel(question: "How do you write 'Hello World' in an alert box?",
                      answer: "B",
                      optionsList: [QuizOption(id: 31, optionId: "A", option: "alertBox('Hello World');", color: Color.yellow),
                                    QuizOption(id: 32, optionId: "B", option: "alert('Hello World');", color: Color.red),
                                    QuizOption(id: 33, optionId: "C", option: "msgBox('Hello World');", color: Color.green),
                                    QuizOption(id: 34, optionId: "D", option: "msg('Hello World');", color: Color.purple)]),
            QuizModel(question: "How do you call a function named 'myFunction'?",
                      answer: "B",
                      optionsList: [QuizOption(id: 31, optionId: "A", option: "", color: Color.yellow),
                                    QuizOption(id: 32, optionId: "B", option: "myFunction()", color: Color.red),
                                    QuizOption(id: 33, optionId: "C", option: "call myFunction()", color: Color.green),
                                    QuizOption(id: 34, optionId: "D", option: "call function myFunction()", color: Color.purple)]),
            QuizModel(question: "How to write an IF statement in JavaScript?",
                      answer: "D",
                      optionsList: [QuizOption(id: 31, optionId: "A", option: "if i == 5 then", color: Color.yellow),
                                    QuizOption(id: 32, optionId: "B", option: "if i = 5 then", color: Color.red),
                                    QuizOption(id: 33, optionId: "C", option: "if i = 5", color: Color.green),
                                    QuizOption(id: 34, optionId: "D", option: "if (i==5)", color: Color.purple)]),
            QuizModel(question: "How to write an IF statement for executing some code if 'i' is NOT equal to 5?",
                      answer: "C",
                      optionsList: [QuizOption(id: 31, optionId: "A", option: "if i <> 5", color: Color.yellow),
                                    QuizOption(id: 32, optionId: "B", option: "if (i <> 5)", color: Color.red),
                                    QuizOption(id: 33, optionId: "C", option: "if (i != 5)", color: Color.green),
                                    QuizOption(id: 34, optionId: "D", option: "if i=! 5 then", color: Color.purple)]),
            QuizModel(question: "How can you add a comment in a JavaScript?",
                      answer: "A",
                      optionsList: [QuizOption(id: 31, optionId: "A", option: "With //", color: Color.yellow),
                                    QuizOption(id: 32, optionId: "B", option: "With '", color: Color.red),
                                    QuizOption(id: 33, optionId: "C", option: "With <!---->", color: Color.green),
                                    QuizOption(id: 34, optionId: "D", option: "With #", color: Color.purple)])

        ]
    }
}
