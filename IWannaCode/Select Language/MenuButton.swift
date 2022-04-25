//
//  ChooseButton.swift
//  IWannaCode
//
//  Created by Jakub Sumionka on 21/04/2022.
//

import SwiftUI

struct MenuButton: View {

    let icon: String
    let text: String
    let color: String
    let font: String

    var body: some View {
        ZStack() {
            Rectangle()
                .fill(Color(hex: color))
                .cornerRadius(20)
                .frame(width: UIScreen.screenWidth/2, height: 100, alignment: .center)
                .clipped()
            HStack() {
                Image(systemName: icon)
                    .padding()
                Spacer()
                    Text(text)
                    .font(Font.custom(font, size: 32))
                  Spacer()
            }  .frame(width: UIScreen.screenWidth/2, height: 100, alignment: .center)
            .clipped()
        }
    }
}

struct ChooseButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton(icon: "brain", text: "Coding challenges", color: "FFFFFF", font: "SF Pro Display Regular")
    }
}
