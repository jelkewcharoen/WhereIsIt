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
    @State var allBuildings = [String]()
    //@State var listBuildings = [Building]()
    //information variables
    @State var floor: String = ""
    @State var description: String = ""
    @State public var selectedItem: String?
    @State public var selectedBuilding: String?
    @State var redLabel: String = ""
    
    //others
    @State private var expandedItem: Bool = false
    @State private var expandedBuilding: Bool = false
    
    var db = Firestore.firestore()
    init() {
            UITextView.appearance().backgroundColor = .clear
        }
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundGradientView()
                VStack{
                    Spacer().frame(height: 50)
                    HeaderView()
                    ScrollView {
                        Group{
                            HStack{
                                Text("Item:")
                                    .font(.system(size: 20, weight: .light, design: .rounded))
                                    .foregroundColor(Color("White Black"))
                                    .padding([.top,.leading])
                                Spacer()
                            }
                            AddSearchView(allItems: $allItems, chosenEntity: $selectedItem)
                        }
                        Group{
                            HStack{
                                Text("Building:")
                                    .font(.system(size: 20, weight: .light, design: .rounded))
                                    .foregroundColor(Color("White Black"))
                                    .padding([.top,.leading])
                                Spacer()
                            }
                            
                            AddSearchView(allItems: $allBuildings, chosenEntity: $selectedBuilding)
//                                .onAppear() {
//                                    print(allBuildings)
//                                }
//                                .onTapGesture() {
//                                    if !buildingNameList.isEmpty && allBuildings.isEmpty{
//                                    buildingNameList.forEach({ item in
//                                        allBuildings.append(item)
//                                    })
//                                }
//                            }
                            //todo: change from allitems to some list from google map once we finish location feature
                        }
                        Group{
                            HStack{
                                Text("Floor:")
                                    .font(.system(size: 20, weight: .light, design: .rounded))
                                    .foregroundColor(Color("White Black"))
                                    .padding([.top,.leading])
                                Spacer()
                            }
                            TextField("1", text: $floor).background(Color("Tech Gold")).padding(.horizontal)
                        }
                        
                        Group{
                            HStack{
                                Text("Description:")
                                    .font(.system(size: 20, weight: .light, design: .rounded))
                                    .foregroundColor(Color("White Black"))
                                    .padding([.top,.leading])
                                Spacer()
                            }
                            TextEditor(text: $description)
                                .frame(minHeight: 50.0)
                                .background(Color("Tech Gold"))
                                .padding(.horizontal)
                        }
                        Spacer()
                            .frame(height: 30.0)

                        Text(redLabel)
                            .foregroundColor(Color("New Horizon"))
                        Group{ //buttons
                            HStack{
                                Spacer()
                                Button(action: {
                                    //all fields must be filled out
                                    if(selectedItem != "Item" && selectedBuilding != nil && !floor.isEmpty && !description.isEmpty){
                                        //add item to the database
                                        
                                        if(selectedItem == "Other"){
                                            //has to create a field to add the item name
                                            //db.collection("List").document(selectedItem!).setData(["Exist" : true])
                                        }
                                        db.collection(selectedItem!).document(selectedBuilding!).setData(["hasItem" : true], merge: true)
                                        db.collection(selectedItem!).document(selectedBuilding!).collection(floor).addDocument(data: [
                                            "Description":description]){ err in
                                                if let err = err {
                                                        print("Error adding document: \(err)")
                                                    } else {
                                                        print("Document added")
                                                        self.redLabel = "Added item"
                                                    }
                                            }
                                        self.selectedItem = "Item"
                                        self.floor = ""
                                        self.description = ""
                                    }
                                    //Floor must be int between 0 and 50
                                    else if ( Int(floor) == nil || Int(floor)! < 0 || Int(floor)! > 50) {
                                            self.redLabel = "Please input Integer between 0 and 50"
                                        }
                                    else {
                                        self.redLabel = "Please input all information"
                                    }
                                }) {
                                    Text("Submit")
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
                        }
                    }
                    Spacer()
                    }
            }
            .edgesIgnoringSafeArea([.top, .bottom])
        }
        .statusBar(hidden: true)
        .navigationBarBackButtonHidden(true)
        .onAppear(){
            if !entityNameList.isEmpty{
                entityNameList.forEach({ item in
                    allItems.append(item)
                })
                allItems.append("Other")
            }
            if !buildingList.isEmpty{
                buildingList.forEach({ item in
                    allBuildings.append(item.name)
                })
            }
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

