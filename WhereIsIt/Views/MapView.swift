//
//  MapView.swift
//  WhereIsIt
//
//  Created by Andrew Lukman on 10/10/21.
//

import Foundation
import UIKit
import SwiftUI
import MapKit
import FirebaseFirestore
import CoreLocation

public var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 33.7756, longitude: -84.3963), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))

struct MapView: UIViewRepresentable {
    @Binding var selectedEntity: String
    @StateObject private var viewModel = MapViewModel()
    var db = Firestore.firestore()
    typealias UIViewType = UIView

    
    func makeUIView(context: Context) -> UIView {
        
        viewModel.checkIfLocationServiceIsEnabled()
        
        let view = UIView()
        
        let map = MKMapView()
        map.setRegion(region, animated: true)
        map.showsUserLocation = true
        
        view.addSubview(map)
        
        //read from database
        db.collection(selectedEntity).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    //document.documentID = building  name
                    print("\(document.documentID) => \(document.data())")
                    var lat = 0.0
                    var long = 0.0
                    for building in buildingList {
                        if building.name == document.documentID {
                            lat = building.lat
                            long = building.lng
                            break
                        }
                    }
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
                    map.addAnnotation(annotation)
                }
            }
        }
        
        map.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            map.widthAnchor.constraint(equalTo: view.widthAnchor),
            map.heightAnchor.constraint(equalTo: view.heightAnchor),
            map.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            map.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        //do nothing
    }
}

struct MapView_Previews: PreviewProvider {
    
    static var previews: some View {
        MapView(selectedEntity: .constant("testing"))
    }
}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    
    func checkIfLocationServiceIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
            locationManager?.requestWhenInUseAuthorization()
            locationManager?.startUpdatingLocation()
        } else {
            print("TODO: Show an alert telling user to turn location on!")
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
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
}
