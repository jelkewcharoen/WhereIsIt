//
//  ContentView.swift
//  WhereIsIt
//
//  Created by Green TRectangle()
//

import SwiftUI

struct ContentView: View {
    
    @State var text: String = ""
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("Tech Gold"), Color("Tech Gold"), Color("Main Gradient 2")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)
            VStack{
                HStack{
                    Spacer()
                    Spacer()
                    Text("Where\nIs\nIt?")
                        .font(.system(size: 50, weight: .light, design: .rounded))
                        .foregroundColor(Color("White Black"))
                        .padding(.leading)
                    Image("buzz")
                        .resizable()
                        .scaledToFit()
                        .padding()
                    
                    Spacer()
                }
                NavigationView {
                    ScrollView {
                        CustomizedSearchBar(text: $text)
                        ForEach(entityNameList.filter {
                            self.text.isEmpty ? true : $0.prefix(text.count).localizedCaseInsensitiveContains(text)
                        }, id: \.self) { name in
                            HStack{
                                Text(name)
                                    .padding()
                                Spacer()
                            }
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarTitle("Searching...")
                }
                .frame(width: 300, height: 200, alignment: .center)
                .cornerRadius(20)
                Spacer()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
            
    }
}
