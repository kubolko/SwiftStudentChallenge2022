//
//  OptionsGridView.swift
//  AKQuiz
//
//  Created by richa.e.srivastava on 16/11/2021.
//

import Foundation
import SwiftUI

struct PythonOptionsGridView: View {

    let language: LanguageElement
    var pythongameManagerVM: PythonGameManagerVM
    var columns: [GridItem] = Array(repeating: GridItem(.flexible(minimum: 10, maximum: 50), spacing: UIScreen.screenWidth/4), count: 2)
    var body: some View {

        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(pythongameManagerVM.model.quizModel.optionsList) { quizOption in
                PythonOptionCardView(quizOption: quizOption, lanugage: language)
                    .onTapGesture {
                        pythongameManagerVM.verifyAnswer(selectedOption: quizOption)
                    }
            }
        }

    }

}

struct PythonOptionCardView: View {

    var quizOption: QuizOption
    let lanugage: LanguageElement

    var body: some View {
        VStack {
            if (quizOption.isMatched) && (quizOption.isSelected) {
                PythonOptionStatusImageView(imageName: "checkmark")
            } else if !(quizOption.isMatched) && (quizOption.isSelected) {
                PythonOptionStatusImageView(imageName: "xmark")
            } else {
                PythonOptionView(language: lanugage, quizOption: quizOption)
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

struct PythonOptionView: View {

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

struct PythonOptionStatusImageView: View {
    var imageName: String
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(EdgeInsets(top: 40, leading: 40, bottom: 40, trailing: 40))
            .foregroundColor(Color.white)
    }
}
