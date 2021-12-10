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
    @State private var showAlert = false

    @State var seconds: Int = 0
    @State var timerIsPaused: Bool = true
    @State var timer: Timer? = nil
    
    @State var messageToggle = 0
    
    var titles = ["You Can Help", "Earn Some Points"]
    var messages = ["People are looking for a microwave near you. Do you know of one?", "Entering a microwave near you can earn you rewards."]
    var symbols = ["person.3", "star"]
    var symbolMessages = ["3 requests in past 24 hours", "10 points if you enter now"]
    var buttonTexts = ["Help Out", "Earn Points"]

    var body: some View {
//        VStack(alignment: .leading) {
//            Text(titles[messageToggle])
//                .font(.headline)
//            Text(messages[messageToggle])
//                .padding(.top)
//            Label(symbolMessages[messageToggle], systemImage: symbols[messageToggle])
//                .font(.caption)
//                .padding(.top)
//            Button(buttonTexts[messageToggle]) {
//                showAlert = true;
//                self.stopTimer()
//            }
//            .padding(.top)
//            .alert(isPresented:$showAlert) {
//                Alert(
//                    title: Text("Title"),
//                    message: Text("Button pressed in \(seconds) seconds."),
//                    primaryButton: .destructive(Text("Reset Timer")) {
//                        print("Toggle Prompt...")
//                        seconds = 0;
//                        self.startTimer()
//                        messageToggle = messageToggle == 0 ? 1 : 0;
//                    },
//                    secondaryButton: .cancel()
//                )
//            }
//        }
//        .padding()
//        .background(Color.white)
//        .cornerRadius(20)
//        .onAppear {
//            self.startTimer()
//        }
        NavigationView {
            ScrollView {
                CustomizedSearchBar(text: $text)
                ForEach(entityNameList.filter {
                    self.text.isEmpty ? true : $0.prefix(text.count).localizedCaseInsensitiveContains(text)
                }, id: \.self) { name in
                    HStack{
                        Button(name) {
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
            Firestore.firestore().collection("List").addSnapshotListener{ (querySnapshot, error) in
                entityNameList.removeAll()
                for document in querySnapshot!.documents{
                    entityNameList.append(document.documentID)
                }
            }
        }
    }
    
    func startTimer(){
        timerIsPaused = false
        // 1. Make a new timer
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
        
            self.seconds = self.seconds + 1
        }
    }
    func stopTimer(){
      timerIsPaused = true
      timer?.invalidate()
      timer = nil
    }
}

struct MainSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MainSearchView()
    }
}
