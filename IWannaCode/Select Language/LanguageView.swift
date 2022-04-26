//
//  LanguagesView.swift
//  IWannaCode
//
//  Created by Jakub Sumionka on 16/04/2022.
//

import SwiftUI

struct LanguageView: View {

    @ObservedObject var viewModel: ViewModel
    @EnvironmentObject var viewRouter: ViewRouter
    let index: Int
    let language: LanguageElement

    var body: some View {
        ZStack() {
            LinearGradient(gradient: Gradient(colors: viewModel.stringToColor(color: language.colors)), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            BackgroundSender(images: language.images)
                .edgesIgnoringSafeArea(.all)
            VStack() {
                Spacer()
                    .frame(height: UIScreen.screenHeight*0.125)
                Text("Choose your hero")
                    .font(Font(UIFont.systemFont(ofSize: 40, weight: UIFont.Weight.bold)))
                //MARK: Ticket 13- dodać
              //      .foregroundColor(Color(hex: language.fontColor))
                Spacer()
                Image(language.name)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.screenWidth/4)
                Text(language.name)
                    .foregroundColor(Color(hex: language.fontColor))
                    .font(Font.custom(language.font, size: 34))
                    .padding()
                Text(language.languageDescription)
                    .foregroundColor(Color(hex: language.fontColor))
                    .frame(width: UIScreen.screenWidth - 100)
                    .font(Font.custom(language.font, size: 34))
                    .padding()
                HStack(spacing: 20) {
                    ZStack() {
                        Circle()
                            .fill(Color(.secondarySystemBackground))
                            .frame(width: 10, height: 10)
                        if index == 0 {
                            Circle()
                                .fill(Color(.gray))
                                .frame(width: 10, height: 10)

                        }
                    }
                    ZStack() {
                        Circle()
                            .fill(Color(.secondarySystemBackground))
                            .frame(width: 10, height: 10)

                        if index == 1 {
                            Circle()
                                .fill(Color(.gray))
                                .frame(width: 10, height: 10)

                        }
                    }
                    ZStack() {
                        Circle()
                            .fill(Color(.secondarySystemBackground))
                            .frame(width: 10, height: 10)

                        if index == 2 {
                            Circle()
                                .fill(Color(.gray))
                                .frame(width: 10, height: 10)

                        }
                    }
                }

                Button {
                    withAnimation {
                        switch language.name {
                        case "Swift":
                            viewRouter.currentPage = .swiftMenu
                        case "Python":
                            viewRouter.currentPage = .pythonMenu
                        case "JavaScript":
                            viewRouter.currentPage = .javaScriptMenu
                        default:
                            viewRouter.currentPage = .welcome
                        }
                    }
                } label: {
                    ZStack() {
                        Rectangle()
                            .fill(viewModel.stringToColor(color: [language.buttonColor])[0])
                            .cornerRadius(20)
                        if language.isSemicolon {
                            Text("GoOn();")
                                .font(Font.custom(language.font, size: 34))
                        } else {
                            Text("GoOn()")
                                .font(Font.custom(language.font, size: 34))
                        }
                    }
                    .frame(width: UIScreen.screenWidth * 0.30, height: UIScreen.screenHeight * 0.08)
                }.buttonStyle(PlainButtonStyle())
                Spacer()
            }

        }
    }

}
