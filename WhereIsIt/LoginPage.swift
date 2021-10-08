//
//  ContentView.swift
//  WhereIsIt
//
//  Created by Green TRectangle()
//

import SwiftUI

struct LoginPage: View {
    
    @State var text: String = ""
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("Tech Gold"), Color("Tech Gold"), Color("Main Gradient 2")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)
            VStack{
                HStack{
                    HeaderView()
                }
                Text("LOGIN PAGE")
                Spacer()
            }
        }
    }
}


struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
            .preferredColorScheme(.light)
            
    }
}
