//
//  ContentView.swift
//  WhereIsIt
//
//  Created by Green T
//

import SwiftUI

struct AddPage: View {
    
    @State private var username: String = ""
    @State private var isEditing = false
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundGradientView()
                VStack{
                    Spacer().frame(height: 50)
                    HStack{
                        HeaderView()
                    }
                    HStack{
                        Text("Item:")
                            .font(.system(size: 20, weight: .light, design: .rounded))
                            .foregroundColor(Color("White Black"))
                            .padding()
                        Spacer()
                    }
                    
                    TextField(
                        "User name (email address)",
                         text: $username
                    ) { isEditing in
                        self.isEditing = isEditing
                    } onCommit: {
                        //validate(name: username)
                    }
                    .autocapitalization(.none)
                    .border(Color(UIColor.separator))
                    Spacer()
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
    }
}

struct AddPage_Previews: PreviewProvider {
    static var previews: some View {
        AddPage()
    }
}
