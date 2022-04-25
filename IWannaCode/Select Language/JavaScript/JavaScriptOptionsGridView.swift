//
//  OptionsGridView.swift
//  AKQuiz
//
//  Created by richa.e.srivastava on 16/11/2021.
//

import Foundation
import SwiftUI

struct JavaScriptOptionsGridView: View {

    let language: LanguageElement
    var javaScriptGameManagerVM: JavaScriptGameManagerVM
    var columns: [GridItem] = Array(repeating: GridItem(.flexible(minimum: 10, maximum: 50), spacing: UIScreen.screenWidth/4), count: 2)
    var body: some View {

        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(javaScriptGameManagerVM.model.quizModel.optionsList) { quizOption in
                JavaScriptOptionCardView(language: language, quizOption: quizOption)
                    .onTapGesture {
                        javaScriptGameManagerVM.verifyAnswer(selectedOption: quizOption)
                    }
            }
        }

    }

}

struct JavaScriptOptionCardView: View {

    let language: LanguageElement
    var quizOption: QuizOption
    var body: some View {
        VStack {
            if (quizOption.isMatched) && (quizOption.isSelected) {
                JavaScriptOptionStatusImageView(imageName: "checkmark")
            } else if !(quizOption.isMatched) && (quizOption.isSelected) {
                JavaScriptOptionStatusImageView(imageName: "xmark")
            } else {
                JavaScriptOptionView(language: language, quizOption: quizOption)
            }
        }.frame(width: UIScreen.screenWidth/4, height: 150)
            .background(setBackgroundColor())
            .cornerRadius(40)
    }

    func setBackgroundColor() -> Color {
        if (quizOption.isMatched) && (quizOption.isSelected) {
            return Color.green
        } else if !(quizOption.isMatched) && (quizOption.isSelected) {
            return Color.red
        } else {
            return Color.white
        }
    }
}

struct JavaScriptOptionView: View {

    let language: LanguageElement
    var quizOption: QuizOption

    var body: some View {
        VStack {

            Text(quizOption.option)
                .frame(width: 150)
                .font(.custom(language.font, size: 20))
        }
    }
}

struct JavaScriptOptionStatusImageView: View {
    var imageName: String
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(EdgeInsets(top: 40, leading: 40, bottom: 40, trailing: 40))
            .foregroundColor(Color.white)
    }
}
