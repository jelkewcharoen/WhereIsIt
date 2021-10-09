//
//  ContentView.swift
//  WhereIsIt
//
//  Created by Green T
//

import SwiftUI

struct LoginPage: View {
    
    @State var text: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundGradientView()
                VStack{
                    Spacer().frame(height: 50)
                    HeaderView()
                    Spacer()
                    Text("Before Adding - Login REQUIRED\nLogin Page\nFuture Implementation")
                    
                    Spacer()
                    
                    AddAndBackButtonsView()
                    
                    Spacer()
                    
                }
            }
            .navigationBarHidden(true)
            .navigationBarTitle(Text("Home"))
            .edgesIgnoringSafeArea([.top, .bottom])
        }
        .statusBar(hidden: true)
        .navigationBarBackButtonHidden(true)
    }
}


struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
            .preferredColorScheme(.none)
    }
}
