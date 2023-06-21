//
//  BuyNowView.swift
//  Real-Madrid-2024
//
//  Created by Juan vasquez on 21-06-23.
//

import SwiftUI

struct BuyNowView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                HStack {
                    Button("Buy Now") {
                        print("Tap mee")
                    }
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .font(.title3.bold())
                    .foregroundColor(.white)
                    .background(Color.madridBlue)
                    .cornerRadius(10)
                    .phaseAnimator([false, true]) { content, value in
                        content
                            .scaleEffect(value ? 0.9 : 1)

                    } animation: { _ in
                            .spring(duration: 0.7)
                    }


                }
                .padding()
            }
            .padding(10)
        .background(Color.madridYellow.opacity(0.8))
        }
    }
}

#Preview {
    BuyNowView()
}
