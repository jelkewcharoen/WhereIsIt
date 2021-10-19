//
//  MainSearch.swift
//  WhereIsIt
//
//  Created by Andrew Lukman on 10/8/21.
//
import Firebase
import FirebaseFirestore
import SwiftUI

struct MainSearchView: View {
    
    @State var text: String = ""
    @State private var showingEntityPage = false
    @State private var chosenEntity = ""
    private var db = Firestore.firestore()
    @State public var entityNameList = [String]()
    
    var body: some View {
        NavigationView {
            ScrollView {
                CustomizedSearchBar(text: $text)
                ForEach(entityNameList.filter {
                    self.text.isEmpty ? true : $0.prefix(text.count).localizedCaseInsensitiveContains(text)
                }, id: \.self) { name in
                    HStack{
                        Button(name) {
                            print("Button tapped!")
                            self.chosenEntity = name
                            self.showingEntityPage.toggle()
                        }.sheet(isPresented: $showingEntityPage){
                            ChosenEntityPage(isPresented: $showingEntityPage, selectedEntity: $chosenEntity)
                        }
                        .padding()
                        .foregroundColor(Color("White Black"))
                        Spacer()  // align left
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle("Searching For ...")
        }
        .cornerRadius(20)
        .onAppear(){
            db.collection("List").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else if entityNameList.isEmpty {
                    var i = 0
                    for document in querySnapshot!.documents {
                        entityNameList.append(document.documentID)
                        i+=1
                    }
                }
            }
        }
    }
        
}

struct MainSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MainSearchView()
    }
}
