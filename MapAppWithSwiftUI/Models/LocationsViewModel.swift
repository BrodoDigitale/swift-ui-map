//
//  LocationsView.swift
//  MapAppWithSwiftUI
//
//  Created by Iuliia Sensi on 06/05/26.
//

import Foundation
import  MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    
    //all loaded locations
    @Published var locations: [Location]
    
    //current location
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var region: MapCameraPosition = .region(MKCoordinateRegion())
    
    var mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeOut, {
            region = .region(MKCoordinateRegion(center: location.coordinates, span: mapSpan))
        })
    }
}
