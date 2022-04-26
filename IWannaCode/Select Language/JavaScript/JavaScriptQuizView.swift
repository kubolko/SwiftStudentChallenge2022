//
//  SwiftQuizView.swift
//  IWannaCode
//
//  Created by Jakub Sumionka on 23/04/2022.
//

import SwiftUI

struct JavaScriptQuizView: View {

    @ObservedObject var javaScriptGameManagerVM = JavaScriptGameManagerVM()
    @ObservedObject var viewModel = ViewModel()
    @EnvironmentObject var viewRouter: ViewRouter
    @State private var tag = 0
    let language: LanguageElement

    var body: some View {

        ZStack {
            LinearGradient(gradient: Gradient(colors: viewModel.stringToColor(color: language.colors)), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            BackgroundSender(images: language.images)
                .edgesIgnoringSafeArea(.all)
            if javaScriptGameManagerVM.model.quizCompleted {
                JavaScriptQuizCompletedView(javaScriptgameManagerVM: javaScriptGameManagerVM, language: LanguageElement(name: "JavaScript", languageDescription: "Wanna make a full-fletched website? JavaScript is the way to go! Throughout the years it has evolved and become the default scripting language for modern web sites! ", image: "JavaScript", colors: ["F1F1F1", "E4E4E4"], font: "ArialMT", fontColor: "000000", isSemicolon: true, images: ["JavaScript1", "JavaScript2", "JavaScript3"], index: 2, buttonColor: "F7DF1E"))

            } else {
                VStack {
                    //MARK: Ticket 9- wywalić
                    ZStack() {
                        // MARK: Back Button
                        HStack() {

                            Button {
                                withAnimation {
                                    viewRouter.currentPage = .javaScriptMenu
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

                    Text("Test your JS knowledge before the interview!")
                        .padding()
                        .foregroundColor(Color(hex: language.fontColor))
                        .font(Font.custom(language.font, size: 34))
                    Text("Quiz provided by W3 schools")
                        .font(.footnote)

                    Text(javaScriptGameManagerVM.model.quizModel.question)
                        .padding()
                        .foregroundColor(Color(hex: language.fontColor))
                        .font(Font.custom(language.font, size: 25))
                        .lineLimit(3)
                        .frame(width: UIScreen.main.bounds.size.width/2, alignment: .center)
                        .multilineTextAlignment(.center)

                    JavaScriptOptionsGridView(language: language, javaScriptGameManagerVM: javaScriptGameManagerVM)
                    Spacer()
                    VStack() {
                        ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(.white)
                            .frame(width: UIScreen.screenWidth/2, height: 20)
                            .cornerRadius(20)
                            withAnimation(.default) {
                        Image(language.name)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30)
                            .offset(x: javaScriptGameManagerVM.roundOffset)
                            .animation(.default)
                            }
                        }
                        HStack() {
                            Spacer()
                            Text("Intern")
                            Spacer()
                            Text("Junior")
                            Spacer()
                            Text("Middle")
                            Spacer()
                            Text("Senior")
                        }.frame(width: UIScreen.screenWidth/2, height: 20)
                    }.padding(50)
                }
            }
        }
    }
}
