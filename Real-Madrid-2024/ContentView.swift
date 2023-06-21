//
//  ContentView.swift
//  Real-Madrid-2024
//
//  Created by Juan vasquez on 19-06-23.
//

import SwiftUI


struct ContentView: View {

    @State var activateScale = false
    @State var hiddenShirt = true
    @State var hiddenBuyView = true

    var body: some View {
        GeometryReader { geometry in
            ShirtView()
                .offset(
                    x: .zero,
                    y: hiddenBuyView ? .zero : -60
                )
            BuyNowView()
                .opacity(hiddenBuyView ? 0 : 1)
        }
        .onAppear(perform: {
            withAnimation(.easeIn(duration: 0.5).delay(ShirtView.totalAnimationDuration)) {
                hiddenBuyView.toggle()
            }
        })
    }
}


#Preview {
    ContentView()
}
