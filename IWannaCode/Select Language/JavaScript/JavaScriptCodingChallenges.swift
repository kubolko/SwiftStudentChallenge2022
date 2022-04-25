//
//  SwiftCodingChallenges.swift
//  IWannaCode
//
//  Created by Jakub Sumionka on 22/04/2022.
//

import SwiftUI

struct JavaScriptCodingChallenge: View {

    @EnvironmentObject var viewRouter: ViewRouter
    @StateObject var viewModel: ViewModel
    let language: LanguageElement

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

                Text("Don't have any idea for an app? Try these challenges!")
                    .padding()
                    .foregroundColor(Color(hex: language.fontColor))
                    .font(Font.custom(language.font, size: 34))

                HStack() {
                    VStack() {
                        ZStack() {
                            Rectangle()
                                .fill(.white)
                                .frame(width: UIScreen.screenWidth/5, height: UIScreen.screenWidth/5)
                                .cornerRadius(20)
                            Text("Easy")
                        }
                        ScrollView(.vertical) {
                        ForEach(viewModel.javaScriptCodingChallenges.easy) {i in
                            VStack() {
                                Text("")
                                Text(i.text)
                                    .frame(width: UIScreen.screenWidth/5)
                                Text("")
                            }.background(
                                Rectangle()
                                    .fill(.white)
                                    .cornerRadius(20)
                            )
                            .padding(10)

                        }
                    }
                    }
                    VStack() {
                        ZStack() {
                        Rectangle()
                                .fill(.white)
                            .frame(width: UIScreen.screenWidth/5, height: UIScreen.screenWidth/5)
                            .cornerRadius(20)
                        Text("Intermediate")
                        }
                        ScrollView(.vertical) {
                            ForEach(viewModel.javaScriptCodingChallenges.intermediate) {i in
                                VStack() {
                                    Text("")
                                    Text(i.text)
                                        .frame(width: UIScreen.screenWidth/5)
                                    Text("")
                                }.background(
                                    Rectangle()
                                        .fill(.white)
                                        .cornerRadius(20)
                                )
                                .padding(10)

                            }
                    }
                    }
                    VStack() {
                        ZStack() {
                        Rectangle()
                                .fill(.white)
                            .frame(width: UIScreen.screenWidth/5, height: UIScreen.screenWidth/5)
                            .cornerRadius(20)
                        Text("Hard")
                        }
                        ScrollView(.vertical) {
                        ForEach(viewModel.javaScriptCodingChallenges.hard) {i in
                            VStack() {
                                Text("")
                                Text(i.text)
                                    .frame(width: UIScreen.screenWidth/5)
                                Text("")
                            }.background(
                                Rectangle()
                                    .fill(.white)
                                    .cornerRadius(20)
                            )
                            .padding(10)

                        }
                    }
                }
                }
            }
        }.onAppear(perform: {viewModel.getCodingChallenges(codingChallengesFileName: "JavaScriptCodingChallenges", language: "JavaScript")})
}
}
