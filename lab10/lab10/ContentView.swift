//
//  ContentView.swift
//  lab10
//
//  Created by jerry on 2022/5/25.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State var selection = 1;
    var body: some View {
        if let user = Auth.auth().currentUser{
            ProfileView(user: User(email: user.email!,password: "",name: user.displayName!))
        }else{
            TabView(selection: $selection){
                LoginView().tabItem{Text("登入")}.tag(1)
                RegisterView().tabItem{Text("註冊")}.tag(2)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
