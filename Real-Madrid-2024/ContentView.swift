//
//  ContentView.swift
//  Real-Madrid-2024
//
//  Created by Juan vasquez on 19-06-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("probando")
            MadridLogoView()
            Text("probando 2")
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}

struct CustomCenter: AlignmentID {
  static func defaultValue(in context: ViewDimensions) -> CGFloat {
    context[HorizontalAlignment.center]
  }
}

extension HorizontalAlignment {
  static let customCenter: HorizontalAlignment = .init(CustomCenter.self)
}
