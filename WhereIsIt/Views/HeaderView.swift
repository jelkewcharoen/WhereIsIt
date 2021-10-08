//
//  HeaderView.swift
//  WhereIsIt
//
//  Created by Andrew Lukman on 10/8/21.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        Text("Where\nIs\nIt?")
            .font(.system(size: 50, weight: .light, design: .rounded))
            .foregroundColor(Color("White Black"))
            .padding(.leading)
        Image("buzz")
            .resizable()
            .scaledToFit()
            .padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
