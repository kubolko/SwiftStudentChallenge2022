//
//  OptionsGridView.swift
//  AKQuiz
//
//  Created by richa.e.srivastava on 16/11/2021.
//

import Foundation
import SwiftUI

struct SwiftOptionsGridView: View {
    var gameManagerVM: SwiftGameManagerVM
    var columns: [GridItem] = Array(repeating: GridItem(.flexible(minimum: 10, maximum: 50), spacing: UIScreen.screenWidth/4), count: 2)
    var body: some View {

        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(gameManagerVM.model.quizModel.optionsList) { quizOption in
                SwiftOptionCardView(quizOption: quizOption)
                    .onTapGesture {
                        gameManagerVM.verifyAnswer(selectedOption: quizOption)
                    }
            }
        }

    }

}

struct SwiftOptionCardView: View {
    var quizOption: QuizOption
    var body: some View {
        VStack {
            if (quizOption.isMatched) && (quizOption.isSelected) {
                OptionStatusImageView(imageName: "checkmark")
            } else if !(quizOption.isMatched) && (quizOption.isSelected) {
                OptionStatusImageView(imageName: "xmark")
            } else {
                SwiftOptionView(quizOption: quizOption)
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

struct SwiftOptionView: View {
    var quizOption: QuizOption
    var body: some View {
        VStack {

            Text(quizOption.option)
                .frame(width: 150)
                .font(.system(size: 20, weight: .bold, design: .rounded))
        }
    }
}

struct OptionStatusImageView: View {
    var imageName: String
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(EdgeInsets(top: 40, leading: 40, bottom: 40, trailing: 40))
            .foregroundColor(Color.white)
    }
}
