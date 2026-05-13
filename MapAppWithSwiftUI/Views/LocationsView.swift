//
//  LocationView.swift
//  MapAppWithSwiftUI
//
//  Created by Iuliia Sensi on 06/05/26.
//

import MapKit
import SwiftUI

struct LocationsView: View {

    @EnvironmentObject private var vm: LocationsViewModel

    var body: some View {
        ZStack {
            Map(position: $vm.region)
                .ignoresSafeArea()
            VStack(spacing: 0) {
                Header.padding()
                Spacer()
            }
        }

    }
}

//injecting env var
#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}

extension LocationsView {
    private var Header: some View {
        VStack {
            Button(action: vm.toggleLocationsList) {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none,value: vm.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .padding().font(.headline).foregroundColor(.primary)
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180.0 : 0.0))
                    }
                }
            if vm.showLocationsList {
                LocationsListView()
            }
            
        }.background(.thickMaterial)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }

}
