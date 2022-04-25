//
//  ChooseSwift.swift
//  IWannaCode
//
//  Created by Jakub Sumionka on 20/04/2022.
//

import SwiftUI

struct ChooseJavaScript: View {

    @ObservedObject var viewModel: ViewModel
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        LanguageView(viewModel: viewModel, index: 2, language: LanguageElement(name: "JavaScript", languageDescription: "Wanna make a full-fletched website? JavaScript is the way to go! Throughout the years it has evolved and become the default scripting language for modern web sites! ", image: "JavaScript", colors: ["F1F1F1", "E4E4E4"], font: "ArialMT", fontColor: "000000", isSemicolon: true, images: ["JavaScript1", "JavaScript2", "JavaScript3"], index: 2, buttonColor: "F7DF1E"))
            .contentShape(Rectangle())
            .gesture(
                DragGesture(minimumDistance: 100)
                    .onEnded { endedGesture in
                        if (endedGesture.location.x - endedGesture.startLocation.x) > 0 {
                            withAnimation {
                                viewRouter.currentPage = .chooseSwift
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
