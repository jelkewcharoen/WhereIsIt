//
//  AddItemPage.swift
//  WhereIsIt
//
//  Created by Green T
//

import SwiftUI
import FirebaseFirestore
struct AddItemPage: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var allItems = [String]()
    @State var floor: String = ""
    @State var description: String = ""
    @State var redLabel: String = ""
    @State private var expanded: Bool = false
    @State public var selectedItem = "Item"
    var db = Firestore.firestore()
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
                        VStack{
                            DisclosureGroup("   \(self.selectedItem)", isExpanded: $expanded){
                                ScrollView{
                                    VStack{
                                        ForEach(allItems, id: \.self){ item in
                                            Text(item)
                                                .padding(.all)
                                                .onTapGesture {
                                                    self.selectedItem = item
                                                    withAnimation(){
                                                    self.expanded.toggle()
                                                }
                                            }
                                        }
                                    }
                                }
                            }.background(Color("Tech Gold"))
                                .foregroundColor(.white)
                                .padding(.all)
                            .accentColor(.white)
                            .cornerRadius(8)

                        }.padding(.trailing)
                        HStack{
                            Text("Floor:")
                                .font(.system(size: 20, weight: .light, design: .rounded))
                                .foregroundColor(Color("White Black"))
                                .padding([.top,.leading])
                            Spacer()
                        }
                        entryField(text: $floor)
                        HStack{
                            Text("Description:")
                                .font(.system(size: 20, weight: .light, design: .rounded))
                                .foregroundColor(Color("White Black"))
                                .padding([.top,.leading])
                            Spacer()
                        }
                        entryField(text: $description)
                    }
                    
                    Spacer()
                    Text(redLabel)
                        .foregroundColor(Color("New Horizon"))
                    Spacer()
                    
                    HStack{
                        Spacer()
                        Button(action: {
                            if(selectedItem != "Item" && !floor.isEmpty){
                                //add item to the database
                                print("add item")
                                //placeholders--todo: should be current's location
                                var latitude = 33
                                var longtitude = -85
                                self.redLabel = "Added \(selectedItem ) @\(String(latitude)), \(String(longtitude))"
                                db.collection(selectedItem).addDocument(data: [
                                    "Longitude": longtitude,
                                    "Latitude": latitude,
                                    "Floor": floor,
                                    "Description":description]){ err in
                                        if let err = err {
                                                print("Error adding document: \(err)")
                                            } else {
                                                print("Document added")
                                            }
                                    }
                                self.selectedItem = "Item"
                                self.floor = ""
                                self.description = ""
                            }
                        }) {
                            Text("Use My Location")
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
        .onAppear(){
            entityNameList.forEach({ item in
                allItems.append(item)
            })
            //todo: add support for new entity
            //allItems.append("Other")
        }
    }
}


struct AddItemPage_Previews: PreviewProvider {
    static var previews: some View {
        AddItemPage()
    }
}


struct entryField: View {
    
    @Binding var text: String
    
    var body: some View {
        TextField("",text: $text)
            .autocapitalization(.none)
            .border(Color(UIColor.separator))
            .padding([.leading, .trailing])
    }
}

