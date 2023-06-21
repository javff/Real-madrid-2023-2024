//
//  UIBaizerPath+extensions.swift
//  Real-Madrid-2024
//
//  Created by Juan vasquez on 19-06-23.
//

import Foundation

import UIKit

extension UIBezierPath {
    static func calculateBounds(paths: [UIBezierPath]) -> CGRect {
        let myPaths = UIBezierPath()
        for path in paths {
            myPaths.append(path)
        }
        return (myPaths.bounds)
    }
}
