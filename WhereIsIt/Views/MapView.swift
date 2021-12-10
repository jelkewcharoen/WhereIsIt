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

struct MapView: UIViewRepresentable {
    @Binding var selectedEntity: String
    var db = Firestore.firestore()
    typealias UIViewType = UIView
    
    func makeUIView(context: Context) -> UIView {
        
        let view = UIView()
        
        let coordinate = CLLocationCoordinate2D(latitude: 33.7756, longitude: -84.3963)
        
        let map = MKMapView()
        map.setRegion(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)), animated: true)
        
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
