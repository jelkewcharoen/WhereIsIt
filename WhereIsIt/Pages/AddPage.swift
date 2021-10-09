//
//  ContentView.swift
//  WhereIsIt
//
//  Created by Green T
//

import SwiftUI

struct AddPage: View {
    
    @State private var itemName: String = ""
    
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
                    
                    itemEntryField(itemName: $itemName)
                    
                    Spacer()
                    
                    Button(action: addItem) {
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

func addItem() {
    
}

struct AddPage_Previews: PreviewProvider {
    static var previews: some View {
        AddPage()
    }
}


struct itemEntryField: View {
    
    @Binding var itemName: String
    
    var body: some View {
        TextField("",text: $itemName)
            .autocapitalization(.none)
            .border(Color(UIColor.separator))
            .padding([.leading, .trailing])
    }
}
