//
//  SwiftMenu.swift
//  IWannaCode
//
//  Created by Jakub Sumionka on 21/04/2022.
//

import SwiftUI

struct JavaScriptMenu: View {

    let language: LanguageElement
    @ObservedObject var viewModel: ViewModel
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        ZStack() {
            LinearGradient(gradient: Gradient(colors: viewModel.stringToColor(color: language.colors)), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            BackgroundSender(images: language.images)
                .edgesIgnoringSafeArea(.all)
            VStack() {
                ZStack() {
                    // MARK: Back Button
                    HStack() {

                        Button {
                            withAnimation {
                                viewRouter.currentPage = .chooseJavaScript
                            }
                        } label: {
                            HStack() {
                                Image(systemName: "chevron.backward")
                                    .foregroundColor(.black)
                                Text("Go back")
                                    .foregroundColor(.black)
                            }
                        }.buttonStyle(PlainButtonStyle())
                            .padding()
                        Spacer()
                    }
                    HStack() {
                    Image(language.name)
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.screenWidth/4)

                }
            }

        Text(language.name)
            .padding()
            .foregroundColor(Color(hex: language.fontColor))
            .font(Font.custom(language.font, size: 34))

        Button {
            withAnimation {
                viewRouter.currentPage = .javaScriptInfo
            }
        } label: {
            MenuButton(icon: "info.circle", text: "Information not to forget!", color: "F7DF1E", font: "ArialMT")
        }.buttonStyle(PlainButtonStyle())
        Button {
            withAnimation {
                viewRouter.currentPage = .javaScriptInterviewTips
            }
        } label: {
            MenuButton(icon: "quote.bubble", text: "Interview Tips", color: "F7DF1E", font: "ArialMT")
        }.buttonStyle(PlainButtonStyle())
        Button {
            withAnimation {
                viewRouter.currentPage = .javaScriptCodingChallenge
            }
        } label: {
            MenuButton(icon: "brain", text: "Coding challenges", color: "F7DF1E", font: "ArialMT")
        }.buttonStyle(PlainButtonStyle())
        Button {
            withAnimation {
                viewRouter.currentPage = .javaScriptQuiz
            }
        } label: {
            MenuButton(icon: "gamecontroller", text: "Coding Quiz", color: "F7DF1E", font: "ArialMT")
        }.buttonStyle(PlainButtonStyle())
    }
}
}
}
