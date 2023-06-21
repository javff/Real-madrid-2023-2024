//
//  ShirtView.swift
//  Real-Madrid-2024
//
//  Created by Juan vasquez on 21-06-23.
//

import SwiftUI

struct ShirtView: View {
    @State var activateScale = false
    @State var hiddenShirt = true

    static var totalAnimationDuration: CGFloat {
        ShirtContentView.totalAnimationDuration + 3
    }

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
                ShirtContentView()
                    .scaleEffect(activateScale ? 0.5 : 1)
                
            }
            .padding()
            .onAppear(perform: {
                withAnimation(.easeInOut(duration: 3).delay(ShirtContentView.totalAnimationDuration)) {
                    activateScale.toggle()
                }

                withAnimation(.easeInOut(duration: 2).delay(ShirtContentView.totalAnimationDuration + 1)) {
                    hiddenShirt.toggle()
                }
            })
        }
    }
}

#Preview {
    ShirtView()
}
