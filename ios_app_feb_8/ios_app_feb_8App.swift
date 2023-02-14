//
//  ios_app_feb_8App.swift
//  ios_app_feb_8
//
//  Created by Tran Thai Quyen on 08/02/2023.
//

import SwiftUI

@main
struct ios_app_feb_8App: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
