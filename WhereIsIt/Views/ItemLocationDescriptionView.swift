//
//  ItemLocationDescriptionView.swift
//  WhereIsIt
//
//  Created by Andrew Widjaja on 12/11/21.
//

import SwiftUI

struct ItemLocationDescriptionView: View {
    @Binding var selectedEntity: String
    @Binding var selectedBuilding: String?
    @Binding var entityLocationDescription: String?
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                Text("\(selectedEntity) at \(selectedBuilding!)")
                Spacer()
                Text("\(entityLocationDescription!)")
                Button("Close") {
                    self.isPresented = false;
                }
                Spacer()
            }
        }
        
    }
}

struct ItemLocationDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ItemLocationDescriptionView(selectedEntity: .constant("selectedEntity"),
                                    selectedBuilding: .constant("Building Name"),
                                    entityLocationDescription: .constant("Building Name"),
                                    isPresented: .constant(true))
    }
}
