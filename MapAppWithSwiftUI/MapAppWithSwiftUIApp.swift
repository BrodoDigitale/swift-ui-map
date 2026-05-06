//
//  MapAppWithSwiftUIApp.swift
//  MapAppWithSwiftUI
//
//  Created by Iuliia Sensi on 10/03/26.
//

import SwiftUI

@main
struct MapAppWithSwiftUIApp: App {
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            //every child of this view will have access to vm
            LocationsView().environmentObject(vm)
        }
    }
}
