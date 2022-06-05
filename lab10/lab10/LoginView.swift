//
//  LoginView.swift
//  lab10
//
//  Created by jerry on 2022/6/1.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @StateObject var user = User()
    var body: some View {
        NavigationView{
            ZStack{
                Color.black
                VStack{
                    Text("登入").font(.title)
                    VStack(spacing:0){
                        Label {
                            TextField("", text: $user.email)
                        } icon: {
                            Image(systemName: "envelope")
                                .frame(width: 14, height: 14)
                                .padding(.leading)
                        }.frame(height: 45)
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 1).frame(height: 45))
                        
                        Label {
                            SecureField("", text: $user.password)
                        } icon: {
                            Image(systemName: "lock")
                                .frame(width: 14, height: 14)
                                .padding(.leading)
                        }.frame(height: 45)
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 1).frame(height: 45))
                        
                    }
                    
                    Button(action: {
                        user.signIn()
                    }){
                        Text("登入")
                            .font(.system(size: 16.0,weight: .bold))
                            .foregroundColor(.black)
                    }
                    .padding(10.0)
                    .frame(width: 370)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.vertical,10)
                    
                    .sheet(isPresented: $user.isLogin){
                        ProfileView(user: user)
                    }
                    NavigationLink(destination: {
                        RegisterView()
                    }, label: {
                        Text("註冊").foregroundColor(.black)
                            .bold()
                            .padding(10.0)
                            .frame(width: 370)
                            .background(.white)
                            
                            .cornerRadius(10)
                    })
                    
                }
                .foregroundColor(.white)
                .padding(.horizontal,20)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
