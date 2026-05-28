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
    
    //current region
    @Published var region: MapCameraPosition = .region(MKCoordinateRegion())
    
    @Published var showLocationsList: Bool = false
    
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
    
    func toggleLocationsList() {
        withAnimation(.easeOut){
            showLocationsList = !showLocationsList
            
        }
    }
    func showNextLocation(location: Location){
        withAnimation(.easeOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
        guard let currIdx = locations.firstIndex(where: {$0 == mapLocation}  ) else {
            print("Could not get current index. Should never happen")
            return
        }
        
        let nextIdx = currIdx + 1
        
        guard locations.indices.contains(nextIdx) else {
            guard let firstLocation = locations.first else {
                return
            }
            showNextLocation(location: firstLocation)
            
            return
        }
        
        let nextLocation = locations[nextIdx]
        showNextLocation(location: nextLocation)
    }
}
