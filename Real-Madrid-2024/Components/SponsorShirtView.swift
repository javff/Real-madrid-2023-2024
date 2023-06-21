//
//  SponsorShirtView.swift
//  Real-Madrid-2024
//
//  Created by Juan vasquez on 20-06-23.
//

import SwiftUI

struct SponsorShirtView: View {
    var body: some View {
        VStack {
            Text("Emirates")
                .font(Font.custom("LaLiga23-24", size: 80))
                .foregroundStyle(Color.madridShirtBlue)
            Text("Fly Better")
                .font(Font.custom("LaLiga23-24", size: 64))
                .foregroundStyle(Color.madridShirtBlue)
        }
    }
}

#Preview {
    SponsorShirtView()
}
