//
//  SwiftQuizView.swift
//  IWannaCode
//
//  Created by Jakub Sumionka on 23/04/2022.
//

import SwiftUI

struct SwiftQuizView: View {

    @ObservedObject var swiftGameManagerVM = SwiftGameManagerVM()
    @ObservedObject var viewModel = ViewModel()
    @StateObject var viewRouter: ViewRouter
    @State private var tag = 0
    let language: LanguageElement

    var body: some View {

        ZStack {
            LinearGradient(gradient: Gradient(colors: viewModel.stringToColor(color: language.colors)), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            BackgroundSender(images: language.images)
                .edgesIgnoringSafeArea(.all)
            if swiftGameManagerVM.model.quizCompleted {
                SwiftQuizCompletedView(gameManagerVM: swiftGameManagerVM, language: LanguageElement(name: "Swift", languageDescription: "Swift is easy to learn, modern, and veeery powerful. Right now it allows you to create an universal app, which will work from Apple Watch to Mac computer. Swift developers are really in need now, there are many iPhones and Macs needing their apps!", image: "Swift", colors: ["FBAF40", "FF3527"], font: "UIFont.systemFont(ofSize: 36, weight: UIFont.Weight.regular)", fontColor: "FFFFFF", isSemicolon: false, images: ["Swift1", "Swift2", "Swift3"], index: 0, buttonColor: "FFFFFF"))
            } else {
                VStack {
                    ZStack() {
                        // MARK: Back Button
                        HStack() {

                            Button {
                                withAnimation {
                                    viewRouter.currentPage = .swiftMenu
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

                    Text("Test your Swift knowledge before the interview!")
                        .padding()
                        .foregroundColor(Color(hex: language.fontColor))
                        .font(Font.custom(language.font, size: 34))

                    Text(swiftGameManagerVM.model.quizModel.question)
                        .padding()
                        .foregroundColor(Color(hex: language.fontColor))
                        .font(Font.custom(language.font, size: 25))
                        .lineLimit(3)
                        .frame(width: UIScreen.main.bounds.size.width/2, alignment: .center)
                        .multilineTextAlignment(.center)

                    SwiftOptionsGridView(gameManagerVM: swiftGameManagerVM)
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
                            .renderingMode(.template)
                            .foregroundColor(.black)
                            .scaledToFit()
                            .frame(width: 30)
                            .offset(x: swiftGameManagerVM.roundOffset)
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
struct SwiftQuizView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftQuizView(viewRouter: ViewRouter(), language: LanguageElement(name: "Swift", languageDescription: "Swift is easy to learn, modern, and veeery powerful. Right now it allows you to create an universal app, which will work from Apple Watch to Mac computer. Swift developers are really in need now, there are many iPhones and Macs needing their apps!", image: "Swift", colors: ["FBAF40", "FF3527"], font: "UIFont.systemFont(ofSize: 36, weight: UIFont.Weight.regular)", fontColor: "FFFFFF", isSemicolon: false, images: ["Swift1", "Swift2", "Swift3"], index: 0, buttonColor: "FFFFFF"))
    }
}
