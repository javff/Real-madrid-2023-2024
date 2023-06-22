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

    var shirtDuration: ShirtDuration {
        .init(
            shirtContentDuration: .init(
                madridLogoAppearDuration: .init(
                    roundDuration: 3,
                    crownDuration: 3,
                    paintDuration: 1.5
                ),
                madridLogoTransition: 0.6,
                sponsorLogoDuration: 0.5
            ),
            scaleShirtDuration: 1.5,
            appearShirtDuration: 1,
            appearShirtDelayDuration: 0.5
        )
    }

    var body: some View {
        GeometryReader { geometry in
            ShirtView(shirtDuration: shirtDuration)
                .offset(
                    x: .zero,
                    y: hiddenBuyView ? .zero : -60
                )
            BuyNowView()
                .opacity(hiddenBuyView ? 0 : 1)
        }
        .onAppear(perform: {
            withAnimation(.easeIn(duration: 0.5).delay(shirtDuration.totalAnimationDuration)) {
                hiddenBuyView.toggle()
            }
        })
    }
}


#Preview {
    ContentView()
}
