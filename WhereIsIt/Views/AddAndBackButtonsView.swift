//
//  AddAndBackButtonsView.swift
//  WhereIsIt
//
//  Created by Andrew Lukman on 10/9/21.
//

import SwiftUI

struct AddAndBackButtonsView: View {
    
    var body: some View {
        HStack{
            Spacer()
            NavigationLink(
                destination: AddPage()) {
                Text("Add")
            }
            .foregroundColor(.white)
            .padding()
            .background(Color("Navy Blue"))
            .cornerRadius(10)
            Spacer()
            
            NavigationLink(
                destination: HomePage()) {
                Text("Back")
            }
            .foregroundColor(.white)
            .padding()
            .background(Color("Navy Blue"))
            .cornerRadius(10)
            Spacer()
        }
    }
}

struct AddAndBackButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        AddAndBackButtonsView()
    }
}

