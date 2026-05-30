//
//  MapMarkerView.swift
//  MapAppWithSwiftUI
//
//  Created by Iuliia Sensi on 30/05/26.
//

import SwiftUI

struct MapMarkerView: View {
    
    let accentColor = Color("AccentColor")
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame( width: 30, height: 30)
                .font(.headline)
                .foregroundColor(Color.white)
                .padding(6)
                .background(accentColor)
                .clipShape(Circle())
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(accentColor)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -4)
                .padding(.bottom, 40)
            
        }
    }
}

#Preview {
    MapMarkerView()
}
