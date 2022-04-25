//
//  ChooseSwift.swift
//  IWannaCode
//
//  Created by Jakub Sumionka on 20/04/2022.
//

import SwiftUI

struct ChoosePython: View {

    @ObservedObject var viewModel: ViewModel
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        LanguageView(viewModel: viewModel, index: 0, language: LanguageElement(name: "Python", languageDescription: "Python is simple. Many people choose it as first language, but don’t think, that you won’t be able to create amazing things with it! Data analysis, visualisation, or web development are python key strenghts.", image: "Python", colors: ["36587E", "253E58"], font: "Menlo-Regular", fontColor: "FFFFFF", isSemicolon: false, images: ["Python1", "Python2", "Python3"], index: 2, buttonColor: "FFFFFF"))
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
                                viewRouter.currentPage = .chooseSwift
                            }
                        }
                    }
            )
    }
}
