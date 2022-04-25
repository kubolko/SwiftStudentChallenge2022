//
//  SwiftInfo.swift
//  IWannaCode
//
//  Created by Jakub Sumionka on 22/04/2022.
//

import SwiftUI

struct SwiftInfo: View {

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

                Text("Don’t forget about that!")
                    .padding()
                    .foregroundColor(Color(hex: language.fontColor))
                    .font(Font.custom(language.font, size: 34))
                    SwiftInfoView(language: language.name, viewModel: viewModel)
                }.onAppear(perform: {viewModel.getLanguageInfo(languageInfoFileName: "SwiftInfo", language: language.name)})
            }
        }
    }
}
struct SwiftInfo_Previews: PreviewProvider {
    static var previews: some View {
        SwiftInfo(language: LanguageElement(name: "Swift", languageDescription: "Swift is easy to learn, modern, and veeery powerful. Right now it allows you to create an universal app, which will work from Apple Watch to Mac computer. Swift developers are really in need now, there are many iPhones and Macs needing their apps!", image: "Swift", colors: ["FBAF40", "FF3527"], font: "UIFont.systemFont(ofSize: 36, weight: UIFont.Weight.regular)", fontColor: "FFFFFF", isSemicolon: false, images: ["Swift1", "Swift2", "Swift3"], index: 0, buttonColor: "FFFFFF"), viewModel: ViewModel())
    }
}
