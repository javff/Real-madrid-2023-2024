//
//  ShirtContentView.swift
//  Real-Madrid-2024
//
//  Created by Juan vasquez on 21-06-23.
//

import SwiftUI

struct ShirtContentView: View {
    private struct MadridAnimationValues {
        var baseScale: CGFloat
        var position: CGPoint
    }

    @State var isHiddenMadridLogo = true
    @State var isHiddenAdidasLogo = true

    private var madridTransitionDuration: CGFloat = 1.2

    var totalShirtDuration: CGFloat {
        MadridLogoView.totalAnimationDuration
    }

    static var totalAnimationDuration: CGFloat {
        MadridLogoView.totalAnimationDuration + 1.2 + 1
    }

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

            MadridLogoView()
            .keyframeAnimator(
                initialValue: MadridAnimationValues(
                    baseScale: 1,
                    position: .init(
                        x: geometry.frame(in: .local).midX,
                        y: geometry.frame(in: .local).midY
                    )
                ),
                trigger: isHiddenMadridLogo,
                content: { content, value in
                    content
                        .scaleEffect(value.baseScale)
                        .position(value.position)
                }, keyframes: { _ in
                    KeyframeTrack(\.baseScale) {
                        CubicKeyframe(0.6, duration: madridTransitionDuration / 2)
                        CubicKeyframe(0.3, duration: madridTransitionDuration / 2)
                    }

                    KeyframeTrack(\.position) {
                        LinearKeyframe(
                            .init(
                                x: geometry.frame(in: .local).maxX - 70,
                                y: geometry.frame(in: .local).minY + 70
                            ),
                            duration: madridTransitionDuration
                        )
                    }
                }
            )

            SponsorShirtView()
                .opacity(isHiddenAdidasLogo ? 0 : 1)
                .position(.init(
                    x: geometry.frame(in: .local).midX,
                    y: geometry.frame(in: .local).midY
                ))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear(perform: {

            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Int(totalShirtDuration))) {
                isHiddenMadridLogo.toggle()
            }

            withAnimation(.easeIn(duration: 1).delay(totalShirtDuration + madridTransitionDuration)) {
                isHiddenAdidasLogo.toggle()
            }
        })
    }
}

#Preview {
    ShirtContentView()
}
