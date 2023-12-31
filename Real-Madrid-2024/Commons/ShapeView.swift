//
//  ShapeView.swift
//  Real-Madrid-2024
//
//  Created by Juan vasquez on 19-06-23.
//

import Foundation
import SwiftUI

struct ShapeView: Shape {

    let bezier: UIBezierPath
    let pathBounds: CGRect

    func path(in rect: CGRect) -> Path {
        let pointScale = (rect.width >= rect.height) ? max(pathBounds.height, pathBounds.width) : min(pathBounds.height, pathBounds.width)

        let pointTransform = CGAffineTransform(scaleX: 1 / pointScale, y: 1 / pointScale)
        let path = Path(bezier.cgPath).applying(pointTransform)
        let multiplier = min(rect.width, rect.height)
        let transform = CGAffineTransform(scaleX: multiplier, y: multiplier)
        return path.applying(transform)
    }
}
