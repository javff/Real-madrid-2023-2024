//
//  MadridLogoView.swift
//  Real-Madrid-2024
//
//  Created by Juan vasquez on 19-06-23.
//

import Foundation
import SwiftUI

struct MadridLogoDuration {
    let roundDuration: CGFloat
    let crownDuration: CGFloat
    let paintDuration: CGFloat

    var totalAnimationDuration: CGFloat {
        roundDuration + crownDuration + paintDuration
    }
}

struct MadridLogoView: View {

    private enum DrawPhases: CaseIterable {
        case round
        case crown
        case end

        var strokeValue: CGFloat {
            switch self {
            case .round: return 0.5475
            case .crown: return 1.0
            case .end: return 1
            }
        }
    }

    private let logoSize: CGRect = {
        UIBezierPath.calculateBounds(paths: [
            LogoPaths.path2(),
            LogoPaths.path3(),
            LogoPaths.path4(),
            LogoPaths.path5()
        ])
    }()

    @State private var roundStrokePhase: CGFloat = 0
    @State private var crownStrokePhase: CGFloat = 0

    @State private var roundFillPhase: Bool = false
    @State private var crownFillPhase: Bool = false
    @State private var startAnimation: Bool = false

    let animationDuration: MadridLogoDuration

    var body: some View {
        ZStack {
            ShapeView(
                bezier: LogoPaths.path2(),
                pathBounds: logoSize
            )
            .trim(from: 0, to: crownStrokePhase)
            .stroke(Color.madridRed)
            .fill(roundFillPhase ? Color.madridRed : Color.clear)

            ShapeView(
                bezier: LogoPaths.path3(),
                pathBounds: logoSize
            )
            .trim(from: 0, to: crownStrokePhase)
            .stroke(Color.madridRed)
            .fill(roundFillPhase ? Color.madridRed : Color.clear)

            ShapeView(
                bezier: LogoPaths.path4(),
                pathBounds: logoSize
            )
            .trim(from: 0, to: crownStrokePhase)
            .stroke(Color.madridYellow)
            .fill(roundFillPhase ? Color.madridYellow : Color.clear)

            ShapeView(
                bezier: LogoPaths.path5(),
                pathBounds: logoSize
            )
            .trim(from: 0, to: roundStrokePhase)
            .stroke(roundFillPhase ? Color.clear : Color.madridBlue)
            .fill(roundFillPhase ? Color.madridBlue : Color.clear)
        }
        .frame(width: 200, height: 272)

        .onAppear(perform: {

            withAnimation(.linear(duration: animationDuration.roundDuration)) {
                roundStrokePhase = DrawPhases.round.strokeValue
            }

            withAnimation(.easeIn(duration: animationDuration.crownDuration).delay(animationDuration.roundDuration)) {
                crownStrokePhase = DrawPhases.crown.strokeValue
                roundStrokePhase = 1
            }

            withAnimation(.linear(duration: animationDuration.paintDuration).delay(animationDuration.roundDuration + animationDuration.crownDuration)) {
                roundFillPhase = true
                crownFillPhase = true
            }
        })
    }
}

#Preview {
    MadridLogoView(animationDuration: .init(roundDuration: 6, crownDuration: 6, paintDuration: 3))
}
