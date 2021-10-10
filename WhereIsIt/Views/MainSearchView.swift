//
//  MainSearch.swift
//  WhereIsIt
//
//  Created by Andrew Lukman on 10/8/21.
//

import SwiftUI

struct MainSearchView: View {
    
    @State var text: String = ""
    @State private var showingEntityPage = false
    @State private var chosenEntity = ""
    
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
            .navigationBarTitle("Searching...")
        }
        .frame(width: 300, height: 200, alignment: .center)
        .cornerRadius(20)
    }
        
}

struct MainSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MainSearchView()
    }
}
