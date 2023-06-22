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

struct AnimationValues {
    var scale = 1.0
    var verticalStretch = 1.0
    var verticalTranslation = 0.0
    var angle = Angle.zero
}

struct ShirtContentView: View {
    private struct MadridAnimationValues {
        var scale: CGFloat
        var position: CGPoint
    }

    @State var isHiddenMadridLogo = true
    @State var isHiddenAdidasLogo = true
    @Binding var madridLogoJumpingActivate: Bool

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

            MadridLogoView(
                animationDuration: shirtContentDuration.madridLogoAppearDuration
            )
            .keyframeAnimator(
                initialValue: AnimationValues(),
                repeating: madridLogoJumpingActivate
            ) { content, value in
                content
                    .foregroundStyle(.red)
                    .rotationEffect(value.angle)
                    .scaleEffect(value.scale)
                    .scaleEffect(y: value.verticalStretch)
                    .offset(y: value.verticalTranslation)
            } keyframes: { _ in
                KeyframeTrack(\.angle) {
                    CubicKeyframe(.zero, duration: 0.58)
                    CubicKeyframe(.degrees(16), duration: 0.125)
                    CubicKeyframe(.degrees(-16), duration: 0.125)
                    CubicKeyframe(.degrees(16), duration: 0.125)
                    CubicKeyframe(.zero, duration: 0.125)
                }

                KeyframeTrack(\.verticalStretch) {
                    CubicKeyframe(1.0, duration: 0.1)
                    CubicKeyframe(0.6, duration: 0.15)
                    CubicKeyframe(1.5, duration: 0.1)
                    CubicKeyframe(1.05, duration: 0.15)
                    CubicKeyframe(1.0, duration: 0.88)
                    CubicKeyframe(0.8, duration: 0.1)
                    CubicKeyframe(1.04, duration: 0.4)
                    CubicKeyframe(1.0, duration: 0.22)
                }

                KeyframeTrack(\.scale) {
                    LinearKeyframe(1.0, duration: 0.36)
                    SpringKeyframe(1.5, duration: 0.8, spring: .bouncy)
                    SpringKeyframe(1.0, spring: .bouncy)
                }

                KeyframeTrack(\.verticalTranslation) {
                    LinearKeyframe(0.0, duration: 0.1)
                    SpringKeyframe(20.0, duration: 0.15, spring: .bouncy)
                    SpringKeyframe(-60.0, duration: 1.0, spring: .bouncy)
                    SpringKeyframe(0.0, spring: .bouncy)
                }
            }
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
        madridLogoJumpingActivate: .constant(true),
        shirtContentDuration: .init(
            madridLogoAppearDuration: .init(
                roundDuration: 1,
                crownDuration: 0,
                paintDuration: 0
            ),
            madridLogoTransition: 1,
            sponsorLogoDuration: 1
        )
    )

}
