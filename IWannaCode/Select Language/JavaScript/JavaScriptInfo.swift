//
//  SwiftInfo.swift
//  IWannaCode
//
//  Created by Jakub Sumionka on 22/04/2022.
//

import SwiftUI

struct JavaScriptInfo: View {

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

                Text("Don’t forget about that!")
                    .padding()
                    .foregroundColor(Color(hex: language.fontColor))
                    .font(Font.custom(language.font, size: 34))
                    JavaScriptInfoView(language: language.name, viewModel: viewModel)
                }.onAppear(perform: {viewModel.getLanguageInfo(languageInfoFileName: "JavaScriptInfo", language: language.name)})
            }
        }
    }
}
