//
//  ContentView.swift
//  WhereIsIt
//
//  Created by Green TRectangle()
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("Tech Gold"), Color("Main Gradient 2")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)
            VStack{
                Text("Where\nIs\nIt?")
                    .font(.system(size: 50, weight: .semibold, design: .rounded))
                    .foregroundColor(Color("White Black"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
            
    }
}
