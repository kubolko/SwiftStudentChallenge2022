//
//  ChooseSwift.swift
//  IWannaCode
//
//  Created by Jakub Sumionka on 20/04/2022.
//

import SwiftUI

struct ChooseSwift: View {

    @ObservedObject var viewModel: ViewModel
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        LanguageView(viewModel: viewModel, index: 1, language: LanguageElement(name: "Swift", languageDescription: "Swift is easy to learn, modern, and veeery powerful. Right now it allows you to create an universal app, which will work from Apple Watch to Mac computer. Swift developers are really in need now, there are many iPhones and Macs needing their apps!", image: "Swift", colors: ["FBAF40", "FF3527"], font: "UIFont.systemFont(ofSize: 36, weight: UIFont.Weight.regular)", fontColor: "FFFFFF", isSemicolon: false, images: ["Swift1", "Swift2", "Swift3"], index: 0, buttonColor: "FFFFFF"))
            .contentShape(Rectangle())
            .gesture(
                DragGesture(minimumDistance: 100)
                    .onEnded { endedGesture in
                        if (endedGesture.location.x - endedGesture.startLocation.x) > 0 {
                            withAnimation {
                                viewRouter.currentPage = .choosePython
                            }
                        } else {
                            withAnimation {
                                viewRouter.currentPage = .chooseJavaScript
                            }
                        }
                    }
            )
    }
}

struct ChooseSwift_Previews: PreviewProvider {
    static var previews: some View {
        ChooseSwift(viewModel: ViewModel())
    }
}
