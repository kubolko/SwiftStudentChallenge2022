//
//  QuizCompletedView.swift
//  AKQuiz
//
//  Created by richa.e.srivastava on 16/11/2021.
//

import Foundation
import SwiftUI

struct JavaScriptQuizCompletedView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var javaScriptgameManagerVM: JavaScriptGameManagerVM
    let language: LanguageElement
    var body: some View {
        ZStack() {
            javaScriptgameManagerVM.model.quizWinningStatus ?
            EmojiBackgound(images: "🥳".image()!, particleCount: 10, creationPoint: .init(x: 0.5, y: -0.1), creationRange: CGSize(width: 1, height: 0), colors: [Color(red: 0.8, green: 0.8, blue: 1)], alphaRange: 1, angle: Angle(degrees: 180), scale: 0.4, speed: 1000, speedRange: 400, animation: Animation.linear(duration: 10).repeatForever(autoreverses: false), animationDelayThreshold: 1) :
            EmojiBackgound(images: "😩".image()!, particleCount: 10, creationPoint: .init(x: 0.5, y: -0.1), creationRange: CGSize(width: 1, height: 0), colors: [Color(red: 0.8, green: 0.8, blue: 1)], alphaRange: 1, angle: Angle(degrees: 180), scale: 0.4, speed: 1000, speedRange: 400, animation: Animation.linear(duration: 10).repeatForever(autoreverses: false), animationDelayThreshold: 1)

        VStack {
            Text(javaScriptgameManagerVM.model.quizWinningStatus ?
                 "You Won!" :
                    "Game Over 😩")
            .padding()
            .foregroundColor(Color(hex: language.fontColor))
            .font(Font.custom(language.font, size: 34))
            .padding()

            Image(javaScriptgameManagerVM.model.quizWinningStatus ?
                  "HappyTim" :
                    "SadTim")
            .padding()

            Text(javaScriptgameManagerVM.model.quizWinningStatus
                 ? "Wow! You really shine with the knowledge!"
                 : "I think you still need to learn a few things")
            .padding()
            .foregroundColor(Color(hex: language.fontColor))
            .font(Font.custom(language.font, size: 28))
            .padding()

            Button {
                withAnimation {
                    javaScriptgameManagerVM.restartGame()
                viewRouter.currentPage = .javaScriptMenu
                }
            } label: {
                ZStack {
                    Rectangle()
                        .fill(.white)
                        .cornerRadius(20)
                        .frame(width: UIScreen.screenWidth/2, height: 100)
                    Text("Go to main menu")
                        .padding()
                        .foregroundColor(.black)
                        .font(Font.custom(language.font, size: 24))

                }
            }.frame(width: 300, height: 60, alignment: .center)
                .cornerRadius(30)
                .padding()

        }
    }
}
}
