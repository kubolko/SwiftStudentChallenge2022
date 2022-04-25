//
//  IWannaCodeApp.swift
//  IWannaCode
//
//  Created by Jakub Sumionka on 16/04/2022.
//

import SwiftUI

@main
struct IWannaCodeApp: App {

    @StateObject var viewRouter = ViewRouter()
//GitComment
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewRouter)
        }
    }
}
