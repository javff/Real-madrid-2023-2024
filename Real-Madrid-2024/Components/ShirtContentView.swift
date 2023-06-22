//
//  ShirtContentView.swift
//  Real-Madrid-2024
//
//  Created by Juan vasquez on 21-06-23.
//

import SwiftUI

struct ShirtContentDuration {
    let madridLogoAppearDuration: MadridLogoDuration
    let madridLogoTransition: CGFloat
    let sponsorLogoDuration: CGFloat

    var totalAnimationDuration: CGFloat {
        madridLogoAppearDuration.totalAnimationDuration + madridLogoTransition + sponsorLogoDuration
    }
}

struct ShirtContentView: View {
    private struct MadridAnimationValues {
        var scale: CGFloat
        var position: CGPoint
    }

    @State var isHiddenMadridLogo = true
    @State var isHiddenAdidasLogo = true

    let shirtContentDuration: ShirtContentDuration

    var body: some View {
        GeometryReader { geometry in
            Image(.adidas)
                .renderingMode(.template)
                .resizable()
                .frame(width: 80, height: 50)
                .foregroundColor(.madridShirtBlue)
                .scaledToFit()
                .opacity(isHiddenAdidasLogo ? 0 : 1)
                .position(.init(
                    x: geometry.frame(in: .local).minX + 70,
                    y: geometry.frame(in: .local).minY + 70
                ))

            MadridLogoView(animationDuration: shirtContentDuration.madridLogoAppearDuration)
            .keyframeAnimator(
                initialValue: MadridAnimationValues(
                    scale: 1,
                    position: .init(
                        x: geometry.frame(in: .local).midX,
                        y: geometry.frame(in: .local).midY
                    )
                ),
                trigger: isHiddenMadridLogo,
                content: { content, value in
                    content
                        .scaleEffect(value.scale)
                        .position(value.position)
                }, keyframes: { _ in
                    KeyframeTrack(\.scale) {
                        CubicKeyframe(0.6, duration: shirtContentDuration.madridLogoTransition / 2)
                        CubicKeyframe(0.3, duration: shirtContentDuration.madridLogoTransition / 2)
                    }

                    KeyframeTrack(\.position) {
                        LinearKeyframe(
                            .init(
                                x: geometry.frame(in: .local).maxX - 70,
                                y: geometry.frame(in: .local).minY + 70
                            ),
                            duration: shirtContentDuration.madridLogoTransition
                        )
                    }
                }
            )

            SponsorShirtView()
                .opacity(isHiddenAdidasLogo ? 0 : 1)
                .position(.init(
                    x: geometry.frame(in: .local).midX,
                    y: geometry.frame(in: .local).minY + 200
                ))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear(perform: {

            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Int(shirtContentDuration.madridLogoAppearDuration.totalAnimationDuration))) {
                isHiddenMadridLogo.toggle()
            }

            withAnimation(.easeIn(duration: shirtContentDuration.sponsorLogoDuration).delay(shirtContentDuration.madridLogoAppearDuration.totalAnimationDuration + shirtContentDuration.madridLogoTransition)) {
                isHiddenAdidasLogo.toggle()
            }
        })
    }
}

#Preview {
    ShirtContentView(
        shirtContentDuration: .init(
            madridLogoAppearDuration: .init(
                roundDuration: 6,
                crownDuration: 6,
                paintDuration: 3
            ),
            madridLogoTransition: 1.2,
            sponsorLogoDuration: 1
        )
    )
}
