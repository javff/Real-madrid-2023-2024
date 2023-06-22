//
//  SponsorShirtView.swift
//  Real-Madrid-2024
//
//  Created by Juan vasquez on 20-06-23.
//

import SwiftUI

struct SponsorShirtView: View {
    var body: some View {
        VStack() {
            Text("Emirates")
                .font(Font.custom("Emirates", size: 64))
                .foregroundStyle(Color.madridShirtBlue)

            Text("FLY BETTER")
                .font(Font.custom("Emirates", size: 48))
                .foregroundStyle(Color.madridShirtBlue)
        }
    }
}

#Preview {
    SponsorShirtView()
}
