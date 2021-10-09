//
//  ContentView.swift
//  WhereIsIt
//
//  Created by Green T
//

import SwiftUI

struct HomePage: View {
    
    @State var text: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundGradientView()
                VStack{
                    Spacer().frame(height: 50)
                    HeaderView()
                    MainSearchView()
                    NavigationLink(
                        destination: LoginPage()) {
                        Text("Add")
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("Navy Blue"))
                    .cornerRadius(10)
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


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
            .preferredColorScheme(.none)
    }
}
