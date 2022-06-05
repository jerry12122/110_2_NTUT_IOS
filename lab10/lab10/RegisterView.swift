//
//  RegisterView.swift
//  lab10
//
//  Created by jerry on 2022/6/1.
//

import SwiftUI

struct RegisterView: View {
    @State var user = User()
    var body: some View {
        ZStack{
            //  BG
            Color.black
            VStack{
                //  logo
                Text("註冊").font(.title)
                
                //  Form
                VStack(spacing:0){
                    Label {
                        TextField("name", text: $user.name)
                    } icon: {
                        Image(systemName: "person")
                            .frame(width: 14, height: 14)
                            .padding(.leading)
                    }.frame(height: 45)
                    .overlay(Rectangle().stroke(Color.white, lineWidth: 1).frame(height: 45))
                    
                    
                    Label {
                        TextField("email", text: $user.email)
                    } icon: {
                        Image(systemName: "envelope")
                            .frame(width: 14, height: 14)
                            .padding(.leading)
                    }.frame(height: 45)
                    .overlay(Rectangle().stroke(Color.white, lineWidth: 1).frame(height: 45))
                    
                    Label {
                        SecureField("password", text: $user.password)
                    } icon: {
                        Image(systemName: "lock")
                            .frame(width: 14, height: 14)
                            .padding(.leading)
                    }.frame(height: 45)
                    .overlay(Rectangle().stroke(Color.white, lineWidth: 1).frame(height: 45))
                    
                }
                //  Button SignIn
                Button(action: {
                    user.createUser()	
                }){
                    Text("註冊")
                        .font(.system(size: 16.0,weight: .bold))
                        .foregroundColor(.black)
                }
                .padding(10.0)
                .background(Color.white)
                .cornerRadius(10)
                .padding(10.0)
                
                
            }
            .foregroundColor(.white)
            .padding(.horizontal,20)

        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
