//
//  ContentView.swift
//  WhereIsIt
//
//  Created by Green T
//

import SwiftUI

struct AddPage: View {
    
    @State var itemName: String = ""
    @State var locationName: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundGradientView()
                VStack{
                    Spacer().frame(height: 50)
                    HeaderView()
                    HStack{
                        Text("Item:")
                            .font(.system(size: 20, weight: .light, design: .rounded))
                            .foregroundColor(Color("White Black"))
                            .padding([.top,.leading])
                        Spacer()
                    }
                    
                    itemEntryField(name: $itemName)
                    
                    Spacer().frame(height: 50)
                    
                    HStack{
                        Text("Location:")
                            .font(.system(size: 20, weight: .light, design: .rounded))
                            .foregroundColor(Color("White Black"))
                            .padding([.top,.leading])
                        Spacer()
                    }
                    
                    locationEntryField(location: $locationName)
                    
                    Spacer()
                    
                    Button(action: {
                        print("Item name: " + itemName)
                        print("Location: " + locationName)
                    }) {
                        Text("Add Item")
                    }
                    
//                    NavigationLink(
//                        destination: LoginPage()) {
//                        Text("Add")
//                    }
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color("Navy Blue"))
//                    .cornerRadius(10)
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


struct AddPage_Previews: PreviewProvider {
    static var previews: some View {
        AddPage()
    }
}


struct itemEntryField: View {
    
    @Binding var name: String
    
    var body: some View {
        TextField("",text: $name)
            .autocapitalization(.none)
            .border(Color(UIColor.separator))
            .padding([.leading, .trailing])
    }
}

struct locationEntryField: View {
    
    @Binding var location: String
    
    var body: some View {
        TextField("",text: $location)
            .autocapitalization(.none)
            .border(Color(UIColor.separator))
            .padding([.leading, .trailing])
    }
}
