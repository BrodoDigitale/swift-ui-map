# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build & Run

This is a pure Xcode project — there is no `Package.swift` or external package manager.

Build from the command line:
```bash
xcodebuild -project MapAppWithSwiftUI.xcodeproj \
  -scheme MapAppWithSwiftUI \
  -destination 'platform=iOS Simulator,name=iPhone 16' \
  build
```

There is no test target in the project. The primary way to verify changes is to build and run in the Simulator via Xcode (`⌘R`).

## Architecture

The app follows MVVM with SwiftUI + MapKit. There are three layers:

**Model** (`Models/Location.swift`)  
`Location` is a value type (`struct`) conforming to `Identifiable`. Its `id` is computed as `name + cityName` (no UUID). It holds `CLLocationCoordinate2D` for map coordinates and an array of asset-catalog image name strings.

**Data Service** (`DataServices/LocationsDataService.swift`)  
`LocationsDataService` is a class with a single `static let locations: [Location]` array. All location data is hardcoded here — there is no network layer or persistence. Adding a new location means appending to this array and adding matching images to `Assets.xcassets/Locations/`.

**View + ViewModel** (`Views/LocationView.swift`)  
`LocationsViewModel` (an `ObservableObject`) and `LocationView` are co-located in the same file. The ViewModel initialises by pulling from `LocationsDataService.locations` and exposes it as `@Published var locations`.

`ContentView.swift` is still the default SwiftUI placeholder and is not yet connected to the map feature.

## Assets Convention

Location images live under `Assets.xcassets/Locations/<CityName>/` as named imagesets. Image names in `LocationsDataService` must match the imageset names exactly (e.g. `"rome-colosseum-1"`).
