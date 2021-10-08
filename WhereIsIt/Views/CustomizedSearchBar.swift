//
//  MainSearchBar.swift
//  WhereIsIt
//
//  Created by Andrew Lukman on 10/8/21.
//

import Foundation
import SwiftUI

struct CustomizedSearchBar: UIViewRepresentable {
    
    @Binding var text: String
    
    func makeUIView(context: UIViewRepresentableContext<CustomizedSearchBar>) -> UISearchBar {
        let searchbar = UISearchBar(frame: .zero)
        searchbar.autocapitalizationType = .none
        searchbar.delegate = context.coordinator
        return searchbar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<CustomizedSearchBar>) {
        uiView.text = text
    }
    
    func makeCoordinator() -> CustomizedSearchBar.Coordinator {
        return Coordinator(text: $text)
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
        
    }
}
