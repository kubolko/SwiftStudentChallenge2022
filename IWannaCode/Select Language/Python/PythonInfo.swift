//
//  SwiftInfo.swift
//  IWannaCode
//
//  Created by Jakub Sumionka on 22/04/2022.
//

import SwiftUI

struct PythonInfo: View {

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
                ScrollView(.vertical) {
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

                Text("Don’t forget about that!")
                    .padding()
                    .foregroundColor(Color(hex: language.fontColor))
                    .font(Font.custom(language.font, size: 34))
                    PythonInfoView(language: language.name, viewModel: viewModel)
                }.onAppear(perform: {viewModel.getLanguageInfo(languageInfoFileName: "PythonInfo", language: language.name)})
            }
        }
    }
}
struct PythonInfo_Previews: PreviewProvider {
    static var previews: some View {
        PythonInfo(language: LanguageElement(name: "Python", languageDescription: "Python is simple. Many people choose it as first language, but don’t think, that you won’t be able to create amazing things with it! Data analysis, visualisation, or web development are python key strenghts.", image: "Python", colors: ["36587E", "253E58"], font: "Menlo-Regular", fontColor: "FFFFFF", isSemicolon: false, images: ["Python1", "Python2", "Python3"], index: 2, buttonColor: "FFFFFF"), viewModel: ViewModel())
    }
}
