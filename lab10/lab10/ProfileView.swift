//
//  ProfileView.swift
//  lab10
//
//  Created by jerry on 2022/6/1.
//

import SwiftUI

struct ProfileView: View {
    let user :User
    var body: some View {
        ZStack{
            Color.black
            VStack{
                Text("已登入").foregroundColor(.red)
                    .font(.title)
                    .padding()
                HStack{
                    Text("名字:")
                        .foregroundColor(.white)
                    Spacer()
                    Text(user.name)
                        .foregroundColor(.white)
                }.padding(.horizontal,30)
                    .padding(.vertical,10)
                HStack{
                    Text("Email:")
                        .foregroundColor(.white)
                    Spacer()
                    Text(user.email)
                        .foregroundColor(.white)
                }.padding(.horizontal,30)
                    .padding(.vertical,10)
                Button(action: {
                    user.singOut()
                    ContentView()
                }, label: {
                    Text("登出")
                        .foregroundColor(.black)
                })
                    .padding(10)
                    .background(.white)
                    .cornerRadius(10)
            }
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        var user = User()
        ProfileView(user:user)
    }
}
