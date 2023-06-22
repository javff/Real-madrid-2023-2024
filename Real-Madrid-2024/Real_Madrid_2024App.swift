//
//  Real_Madrid_2024App.swift
//  Real-Madrid-2024
//
//  Created by Juan vasquez on 19-06-23.
//

import SwiftUI

@main
struct Real_Madrid_2024App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }

    init() {
        for (index, family) in UIFont.familyNames.sorted().enumerated() {
                   let names = UIFont.fontNames(forFamilyName: family)
            print(index)
                   print("Family: \(family) Font names: \(names)")
               }
    }
}
