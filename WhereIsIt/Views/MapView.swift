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

struct MapView: UIViewRepresentable {
    
    typealias UIViewType = UIView
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        
        let coordinate = CLLocationCoordinate2D(latitude: 33.7756, longitude: -84.3963)
        
        let map = MKMapView()
        map.setRegion(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)), animated: true)
        
        view.addSubview(map)
        
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
