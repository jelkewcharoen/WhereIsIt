//
//  ChosenEntityPage.swift
//  WhereIsIt
//
//  Created by Green T
//

import SwiftUI

struct ChosenEntityPage: View {
    @Binding var isPresented: Bool
    @Binding var selectedEntity: String
    
    @State var text: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundGradientView()
                VStack{
                    Spacer().frame(height: 50)
                    HeaderView()
                    Text("CHOSEN ENTITY PAGE\nChosen: " + selectedEntity)
                    Spacer().frame(height: 50)
                    Button("Back") {
                        self.isPresented = false;
                    }
                    MapView()
                        .frame(width: 350, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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

struct ChosenEntityPage_Previews: PreviewProvider {
    @State static var previewIsPresented = false
    @State static var previewSelectedEntity = "test"
    static var previews: some View {
        ChosenEntityPage(isPresented: $previewIsPresented, selectedEntity: $previewSelectedEntity)
    }
}
