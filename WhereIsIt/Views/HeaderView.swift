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
            .font(.system(size: 40, weight: .light, design: .rounded))
            .foregroundColor(Color("White Black"))
            .padding(.leading, 30)
        Image("buzz")
            .resizable()
            .scaledToFit()
            .frame(width: 125, height:125, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
