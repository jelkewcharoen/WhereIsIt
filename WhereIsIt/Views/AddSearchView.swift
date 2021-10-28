//
//  AddSearchView.swift
//  WhereIsIt
//
//  Created by Jel Kewcharoen on 10/27/21.
//

import SwiftUI

struct AddSearchView: View {
    @Binding var allItems: [String]
    @Binding var chosenEntity: String?
    
    @State var text: String = ""
    @State private var showingEntityPage = false
   // @State private var chosenEntity: String?
    @State var color: UIColor? = UIColor(Color("Tech Gold"))
    
    var body: some View {
        VStack {
            DisclosureGroup("   \(self.chosenEntity ?? "Select")", isExpanded: $showingEntityPage){
                CustomizedSearchBar(text: $text, color: color)
                ScrollView{
                    ForEach(entityNameList.filter {
                        self.text.isEmpty ? true : $0.prefix(text.count).localizedCaseInsensitiveContains(text)
                    }, id: \.self) { name in
                       
                            Text(name)
                                .padding(.all)
                                .onTapGesture {
                                    self.chosenEntity = name
                                    self.showingEntityPage.toggle()
                                }
                            }
                            .padding()
                            .foregroundColor(Color("White Black"))
                    
                }
            }.background(Color("Tech Gold"))
                .foregroundColor(.white)
                .padding(.horizontal)
            .accentColor(.white)
            .cornerRadius(8)
            

        }
    }
}

struct AddSearchView_Previews: PreviewProvider {
    @State static var items = ["1","2","3"]
    static var previews: some View {
        //AddSearchView()
        //AddSearchView(allItems: $items)
        Text("hello")
    }
    
}
