//
//  InfoView.swift
//  IWannaCode
//
//  Created by Jakub Sumionka on 22/04/2022.
//

import SwiftUI

struct SwiftInfoView: View {

    let language: String
    @StateObject var viewModel: ViewModel

    var body: some View {
        ZStack() {
            Rectangle()
                .fill(.white)
                .cornerRadius(20)
                .frame(width: UIScreen.screenWidth/1.5)

            VStack() {
            ForEach(viewModel.swiftInfo) {i in
                Text(i.headline)
                        .font(.title2)
                        .frame(width: UIScreen.screenWidth/1.5)
                        .padding()
                    Text(i.text)
                        .bold()
                        .frame(width: UIScreen.screenWidth/1.5)
                        .padding()
                }
        }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftInfoView(language: "Swift", viewModel: ViewModel())
    }
}
