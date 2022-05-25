//
//  ContentView.swift
//  lab09
//
//  Created by jerry on 2022/5/25.
//

import SwiftUI
import Foundation

class Record: ObservableObject{
    var name = ""
    var price = 0
    var comment = ""
    init(name: String, price: Int,comment: String) {
        self.name = name
        self.price = price
        self.comment = comment
    }
    init(){
        name = ""
        price = 0
        comment = ""
    }
}
class Records: ObservableObject{
    @Published var records:Array<Record> = Array()
}
struct ContentView: View {
    @State private var addMode = false
    @StateObject private var records = Records()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(records.records, id: \.name) { record in
                        NavigationLink{
                            DetailView(record: record)
                        }label:{
                            Text(record.name)
                        }
                    }
                }
                
                .navigationBarTitle(Text("記帳列表"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                     // button activates link
                      self.addMode = true
                    } ) {
                    Image(systemName: "plus")
                        .resizable()
                        .padding(6)
                        .frame(width: 24, height: 24)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .foregroundColor(.white)
                } )

                // invisible link inside NavigationView for add mode
                NavigationLink(destination: AddDetailView(),
                    isActive: $addMode) { EmptyView() }
            }
        }.environmentObject(records)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
