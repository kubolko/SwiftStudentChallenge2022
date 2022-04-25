//
//  SwiftMenu.swift
//  IWannaCode
//
//  Created by Jakub Sumionka on 21/04/2022.
//

import SwiftUI

struct PythonMenu: View {

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
                                viewRouter.currentPage = .choosePython
                            }
                        } label: {
                            HStack() {
                                Image(systemName: "chevron.backward")
                                    .foregroundColor(.white)
                                Text("Go back")
                                    .foregroundColor(.white)
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
                viewRouter.currentPage = .pythonInfo
            }
        } label: {
            MenuButton(icon: "info.circle", text: "Information not to forget!", color: "FFFFFF", font: "Menlo Regular")
        }.buttonStyle(PlainButtonStyle())
        Button {
            withAnimation {
                viewRouter.currentPage = .pythonInterviewTips
            }
        } label: {
            MenuButton(icon: "quote.bubble", text: "Interview Tips", color: "FFFFFF", font: "Menlo Regular")
        }.buttonStyle(PlainButtonStyle())
        Button {
            withAnimation {
                viewRouter.currentPage = .pythonCodingChallenge
            }
        } label: {
            MenuButton(icon: "brain", text: "Coding challenges", color: "FFFFFF", font: "Menlo Regular")
        }.buttonStyle(PlainButtonStyle())
        Button {
            withAnimation {
                viewRouter.currentPage = .pythonQuiz
            }
        } label: {
            MenuButton(icon: "gamecontroller", text: "Coding Quiz", color: "FFFFFF", font: "Menlo Regular")
        }.buttonStyle(PlainButtonStyle())
    }
}
}
}
