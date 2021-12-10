//
//  MapView2.swift
//  WhereIsIt
//
//  Created by Andrew Widjaja on 12/9/21.
//

import SwiftUI
import MapKit
import FirebaseFirestore


struct MapView2: View {
    @Binding var selectedEntity: String
    @StateObject private var viewModel = MapViewModel()
    var db = Firestore.firestore()
//    @StateObject private var enitityModel = EnitityViewModel()

    
    var body: some View {
        
        Map(coordinateRegion: $viewModel.region,
            showsUserLocation: true)
            .ignoresSafeArea()
            .onAppear {
                db.collection(selectedEntity).getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents {
                            //document.documentID = building  name
                            print("\(document.documentID) => \(document.data())")
                            let latitude  = document.data()["Latitude"] as? Double
                            let longitude = document.data()["Longitude"] as? Double
                            let annotation = MKPointAnnotation()
                            annotation.coordinate = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
                        }
                    }
                }
                viewModel.checkIfLocationServiceIsEnabled()
            }
    }
}

struct MapView2_Previews: PreviewProvider {
    static var previews: some View {
        MapView2(selectedEntity: .constant("testing"))
    }
}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published public var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 33.7756, longitude: -84.3963), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    
    var locationManager: CLLocationManager?
    
    func checkIfLocationServiceIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else {
            print("TODO: Show an alert telling user to turn location on!")
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted likely due to parental controls.")
        case .denied:
            print("Location permission is denied. Go into settings to change it.")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate,
                                        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        @unknown default:
            break;
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
}

