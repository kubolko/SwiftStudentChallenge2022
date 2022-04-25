//
//  BackgroundSender.swift
//  Swift Student Challenge-XCode
//
//  Created by Jakub Sumionka on 17/04/2021.
//

import SwiftUI

struct BackgroundSender: View {
    var images: [String]
    var body: some View {
            EmitterView(images: images, particleCount: 10, creationPoint: .init(x: 0.5, y: -0.1), creationRange: CGSize(width: 1, height: 0), colors: [Color(red: 0.8, green: 0.8, blue: 1)], alphaRange: 1, angle: Angle(degrees: 180), scale: 0.4, speed: 1000, speedRange: 400, animation: Animation.linear(duration: 10).repeatForever(autoreverses: false), animationDelayThreshold: 1)
    }
}

struct BackgroundSender_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundSender(images: ["Swift1", "Swift2", "Swift3"])
    }
}
