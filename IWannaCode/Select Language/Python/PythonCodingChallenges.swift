//
//  SwiftCodingChallenges.swift
//  IWannaCode
//
//  Created by Jakub Sumionka on 22/04/2022.
//

import SwiftUI

struct PythonCodingChallenge: View {

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
                                viewRouter.currentPage = .pythonMenu
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

                Text("Here are some intresting challenges!")
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
                        ForEach(viewModel.pythonCodingChallenges.easy) {i in
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
                        ForEach(viewModel.pythonCodingChallenges.intermediate) {i in
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
                        ForEach(viewModel.pythonCodingChallenges.hard) {i in
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
        }.onAppear(perform: {viewModel.getCodingChallenges(codingChallengesFileName: "PythonCodingChallenges", language: "Python")})
}
}
struct PythonCodingChallenges_Previews: PreviewProvider {
    static var previews: some View {
        SwiftCodingChallenges(viewModel: ViewModel(), language: LanguageElement(name: "Swift", languageDescription: "Swift is easy to learn, modern, and veeery powerful. Right now it allows you to create an universal app, which will work from Apple Watch to Mac computer. Swift developers are really in need now, there are many iPhones and Macs needing their apps!", image: "Swift", colors: ["FBAF40", "FF3527"], font: "UIFont.systemFont(ofSize: 36, weight: UIFont.Weight.regular)", fontColor: "FFFFFF", isSemicolon: false, images: ["Swift1", "Swift2", "Swift3"], index: 0, buttonColor: "FFFFFF"))
    }
}
