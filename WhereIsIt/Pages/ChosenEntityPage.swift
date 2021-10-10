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

//struct ChosenEntityPage_Previews: PreviewProvider {
//
//    static var previews: some View {
//        ChosenEntityPage()
//    }
//}
