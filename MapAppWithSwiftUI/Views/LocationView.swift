//
//  LocationView.swift
//  MapAppWithSwiftUI
//
//  Created by Iuliia Sensi on 06/05/26.
//

import SwiftUI

struct LocationsView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) {
                //$0 first anonymous parameter in a closure in swift
                Text($0.name)
            }
        }
    }
}


//injecting env var
#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
