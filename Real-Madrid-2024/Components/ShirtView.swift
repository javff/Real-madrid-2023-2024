//
//  ShirtView.swift
//  Real-Madrid-2024
//
//  Created by Juan vasquez on 21-06-23.
//

import SwiftUI

struct ShirtDuration {
    let shirtContentDuration: ShirtContentDuration
    let scaleShirtDuration: CGFloat
    let appearShirtDuration: CGFloat
    let appearShirtDelayDuration: CGFloat

    var totalAnimationDuration: CGFloat {
        shirtContentDuration.totalAnimationDuration + max(scaleShirtDuration, appearShirtDuration) + appearShirtDelayDuration
    }
}

struct ShirtView: View {
    @State var activateScale = false
    @State var hiddenShirt = true
    @Binding var madridLogoJumpingActivate: Bool

    let shirtDuration: ShirtDuration

    var body: some View {
        VStack {
            GeometryReader { geometry in
                Image(.madridShirt)
                    .opacity(hiddenShirt ? 0 : 1)
                    .scaleEffect(hiddenShirt ? 1.5 : 1)
                    .position(
                        .init(
                            x: geometry.frame(in: .local).midX,
                            y: geometry.frame(in: .local).midY - 30
                        )
                    )
                ShirtContentView(
                    madridLogoJumpingActivate: $madridLogoJumpingActivate,
                    shirtContentDuration: shirtDuration.shirtContentDuration
                )
                .scaleEffect(
                    activateScale ? 0.5 : 1
                )
                
            }
            .padding()
            .onAppear(perform: {
                withAnimation(.easeInOut(duration: shirtDuration.scaleShirtDuration).delay(shirtDuration.shirtContentDuration.totalAnimationDuration)) {
                    activateScale.toggle()
                }

                withAnimation(.easeInOut(duration: shirtDuration.appearShirtDuration).delay(shirtDuration.shirtContentDuration.totalAnimationDuration + shirtDuration.appearShirtDelayDuration)) {
                    hiddenShirt.toggle()
                }
            })
        }
    }
}

#Preview {
    ShirtView(
        madridLogoJumpingActivate: .constant(true),
        shirtDuration: .init(
            shirtContentDuration: .init(
                madridLogoAppearDuration: .init(
                    roundDuration: 6,
                    crownDuration: 6,
                    paintDuration: 3
                ),
                madridLogoTransition: 1.2,
                sponsorLogoDuration: 1
            ),
            scaleShirtDuration: 3,
            appearShirtDuration: 2,
            appearShirtDelayDuration: 1
        )
    )
}
