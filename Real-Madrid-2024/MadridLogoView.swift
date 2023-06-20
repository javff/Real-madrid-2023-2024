//
//  MadridLogoView.swift
//  Real-Madrid-2024
//
//  Created by Juan vasquez on 19-06-23.
//

import Foundation
import SwiftUI

struct MadridLogoView: View {

    enum DrawPhases: CaseIterable {
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

        var duration: CGFloat {
            switch self {
            case .round: return 4
            case .crown: return 3
            case .end: return 1
            }
        }

        var delay: CGFloat {
            switch self {
            case .round: return 0
            case .crown: return DrawPhases.round.duration
            case .end: return DrawPhases.round.duration + DrawPhases.crown.duration
            }
        }
    }

    private static let size: CGRect = {
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

    var body: some View {
        ZStack {
            ShapeView(
                bezier: LogoPaths.path2(),
                pathBounds: MadridLogoView.size
            )
            .trim(from: 0, to: crownStrokePhase)
            .stroke(Color.madridRed)
            .fill(roundFillPhase ? Color.madridRed : Color.clear)

            ShapeView(
                bezier: LogoPaths.path3(),
                pathBounds: MadridLogoView.size
            )
            .trim(from: 0, to: crownStrokePhase)
            .stroke(Color.madridRed)
            .fill(roundFillPhase ? Color.madridRed : Color.clear)

            ShapeView(
                bezier: LogoPaths.path4(),
                pathBounds: MadridLogoView.size
            )
            .trim(from: 0, to: crownStrokePhase)
            .stroke(Color.madridYellow)
            .fill(roundFillPhase ? Color.madridYellow : Color.clear)

            ShapeView(
                bezier: LogoPaths.path5(),
                pathBounds: MadridLogoView.size
            )
            .trim(from: 0, to: roundStrokePhase)
            .stroke(roundFillPhase ? Color.clear : Color.madridBlue)
            .fill(roundFillPhase ? Color.madridBlue : Color.clear)
        }
        .frame(width: 200, height: 272)

        .onAppear(perform: {

            withAnimation(.linear(duration: DrawPhases.round.duration)) {
                self.roundStrokePhase = DrawPhases.round.strokeValue
            }

            withAnimation(.easeIn(duration: DrawPhases.crown.duration).delay(DrawPhases.crown.delay)) {
                self.crownStrokePhase = DrawPhases.crown.strokeValue
                self.roundStrokePhase = 1
            }

            withAnimation(.linear(duration: DrawPhases.end.duration).delay(DrawPhases.end.delay)) {
                self.roundFillPhase = true
                self.crownFillPhase = true
            }
        })
    }
}

#Preview {
    MadridLogoView()
}

extension Color {
    static let madridYellow = Color(#colorLiteral(red: 0.996, green: 0.745, blue: 0.063, alpha: 1)) // #febe10
    static let madridBlue = Color(#colorLiteral(red: 0, green: 0.322, blue: 0.624, alpha: 1)) // #febe10
    static let madridRed = Color(#colorLiteral(red: 0.933, green: 0.196, blue: 0.306, alpha: 1)) // #ee324e
}
