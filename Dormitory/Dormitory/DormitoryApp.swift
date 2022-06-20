//
//  DormitoryApp.swift
//  Dormitory
//
//  Created by Aaron Ramirez on 6/17/22.
//

import SwiftUI

@main
struct DormitoryApp: App {
    @StateObject var mainxInfo = MainxInfo()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(mainxInfo)
        }
    }
}
