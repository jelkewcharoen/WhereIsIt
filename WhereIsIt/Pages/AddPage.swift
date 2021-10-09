//
//  ContentView.swift
//  WhereIsIt
//
//  Created by Green T
//

import SwiftUI

struct AddPage: View {
    
    @State private var itemName: String = ""
    @State private var isEditing = false
    
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
                    
                    TextField(
                        "",
                         text: $itemName
                    ) { isEditing in
                        self.isEditing = isEditing
                    } onCommit: {
                        //validate(name: itemName)
                    }
                    .autocapitalization(.none)
                    .border(Color(UIColor.separator))
                    .padding([.leading, .trailing])
                    
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

struct AddPage_Previews: PreviewProvider {
    static var previews: some View {
        AddPage()
    }
}
