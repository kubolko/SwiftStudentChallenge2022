//
//  WelcomeView.swift
//  IWannaCode
//
//  Created by Jakub Sumionka on 16/04/2022.
//

import SwiftUI

struct WelcomeMessage: View {

    var body: some View {
        VStack() {
            HStack() {
                Text("Hi!").font(.largeTitle)
                Spacer()
            }.padding()
            HStack() {
                Text("Remember that feeling? \n That booze when being before the first job interview?").font(.callout)
                    .padding()
                    .rotationEffect(Angle(degrees: -12))
                Spacer()
            }
            HStack() {
                Spacer()
                Text("I see a lot of friends trying to find \n thier first job as a developers... ").font(.callout)
                    .padding()
                    .rotationEffect(Angle(degrees: 12))
            }
            HStack() {
                Text("but often they struggle, they don’t \n know some key things other developers look at").font(.callout)
                    .padding()
                    .rotationEffect(Angle(degrees: -12))
                Spacer()
            }
            HStack() {
                Spacer()
                Text("when going through their coding tasks.").font(.callout)
                    .padding()
                    .rotationEffect(Angle(degrees: 12))
            }
            HStack() {
                Text("I would like to show you a few tips, \n that will help you get your first job as an developer!").font(.callout)
                    .padding()
                    .rotationEffect(Angle(degrees: -12))
                Spacer()
            }
            HStack() {
                Spacer()
                Text("Let’s Go!").font(.headline)
                    .bold()
                    .padding()
                    .rotationEffect(Angle(degrees: 12))
            }
            HStack() {
                Image("JakubSumionka")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.screenWidth/6)
                    .clipShape(Circle())
                    .padding()
                VStack() {
                Text("You have it! Good luck!")
                        .font(.title)
                    Text("Jakub Sumionka")
                        .font(.callout)
            }
            }
        }.frame(width: UIScreen.screenWidth * 0.8, height: UIScreen.screenHeight * 0.8)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(viewModel: ViewModel())
    }
}
