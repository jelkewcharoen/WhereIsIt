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
    @State var listBuildings = [Building]()
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
                    .onAppear {
                        Api().getPosts { (buildings) in
                            self.listBuildings = buildings
                        }
                        if !buildingNameList.isEmpty{
                        print("===== I AM HERE =====")
                            buildingNameList.forEach({ item in
                                allBuildings.append(item)
                            })
                        }
                        for building in listBuildings {
                            allBuildings.append(building.name)
                        }
                    }
                    
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
                                    //Floor must be int between 0 and 50
                                    if ( Int(floor) == nil || Int(floor)! < 0 || Int(floor)! > 50) {
                                        self.redLabel = "Please input Integer between 0 and 50"
                                    }
                                    //all fields must be filled out
                                    else if(selectedItem != nil && selectedBuilding != nil && !floor.isEmpty && !description.isEmpty){
                                        //add item to the database
                                        print("add item")
                                        //placeholders--todo: should be current's location
                                        var latitude = 33.774727
                                        var longtitude = -84.397220
                                        self.redLabel = "Added \(selectedItem ) @\(String(latitude)), \(String(longtitude))"
                                        db.collection(selectedItem!).addDocument(data: [
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
            }
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

