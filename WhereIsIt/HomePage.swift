//
//  ContentView.swift
//  WhereIsIt
//
//  Created by Green TRectangle()
//

import SwiftUI

struct HomePage: View {
    
    @State var text: String = ""
    
    var body: some View {
        NavigationView {
            ZStack{
                BackgroundGradientView()
                VStack{
                    HStack{
                        HeaderView()
                    }
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
            .padding(.top, 50)
            .navigationBarHidden(true)
            .navigationBarTitle(Text("Home"))
            .edgesIgnoringSafeArea([.top, .bottom])
        }
    }
}


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
            .preferredColorScheme(.light)
            
    }
}
