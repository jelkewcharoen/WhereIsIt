//
//  AddItemPage.swift
//  WhereIsIt
//
//  Created by Green T
//

import SwiftUI

struct AddItemPage: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var itemName: String = ""
    @State var locationName: String = ""
    @State var redLabel: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundGradientView()
                VStack{
                    Spacer().frame(height: 50)
                    HeaderView()
                    
                    Group {
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
                    }
                    
                    Spacer()
                    Text(redLabel)
                        .foregroundColor(Color("New Horizon"))
                    Spacer()
                    
                    HStack{
                        Spacer()
                        Button(action: {
                            entityNameList.append(itemName)
                            print("Item name: " + itemName)
                            print("Location: " + locationName)
                            self.redLabel = "Added " + itemName + " @" + locationName
                            self.itemName = ""
                            self.locationName = ""
                        }) {
                            Text("Add Item")
                        }
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("Navy Blue"))
                        .cornerRadius(10)
                        Spacer()
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Cancel")
                        }
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("New Horizon"))
                        .cornerRadius(10)
                        Spacer()
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


struct AddItemPage_Previews: PreviewProvider {
    static var previews: some View {
        AddItemPage()
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
