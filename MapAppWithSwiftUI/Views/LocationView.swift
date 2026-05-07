//
//  LocationView.swift
//  MapAppWithSwiftUI
//
//  Created by Iuliia Sensi on 06/05/26.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel


    var body: some View {
        ZStack {
            Map(position: $vm.region)
        }
    }
}


//injecting env var
#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
