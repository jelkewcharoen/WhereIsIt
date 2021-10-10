//
//  ContentView.swift
//  WhereIsIt
//
//  Created by Green T
//

import SwiftUI

struct HomePage: View {
    
    @State var text: String = ""
    @State private var showingEntityPage = false
    @State private var showingDeveloperPage = false
    
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
                    Group{
                        Text("Developer Button:")
                        Button("Show item list") {
                            self.showingDeveloperPage.toggle()
                        }.sheet(isPresented: $showingDeveloperPage){
                            DeveloperPage(isPresented: $showingDeveloperPage)
                        }
                    }
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

struct DeveloperPage: View {
    @Binding var isPresented: Bool
    
    var body: some View{
        Text(entityNameList.description)
        Button("Close") {
            self.isPresented = false;
        }
        .foregroundColor(.white)
        .padding()
        .background(Color("Navy Blue"))
        .cornerRadius(10)
    }
}


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
            .preferredColorScheme(.none)
    }
}
