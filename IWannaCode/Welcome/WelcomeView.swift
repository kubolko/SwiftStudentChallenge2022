//
//  Welcome.swift
//  IWannaCode
//
//  Created by Jakub Sumionka on 16/04/2022.
//

import SwiftUI

struct WelcomeView: View {

    @ObservedObject var viewModel: ViewModel
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State private var isShowing = true

    var body: some View {
        if isShowing {
            ZStack() {
           //MARK: Ticket 1
                LinearGradient(gradient: Gradient(colors: viewModel.stringToColor(color: ["FBAF40", "FF3527"])), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                    
                //
                Button {
                    withAnimation {
                        isShowing.toggle()
                        viewRouter.currentPage = .chooseSwift
                    }
                } label: {
                    WelcomeMessage()
                        .frame(width: UIScreen.screenWidth * 0.8, height: UIScreen.screenHeight * 0.8)
                }.buttonStyle(PlainButtonStyle())
            }
        }
    }
}

// struct Welcome_Previews: PreviewProvider {
//    static var previews: some View {
//        WelcomeView(viewModel: ViewModel()).environmentObject(ViewRouter())
//    }
// }
