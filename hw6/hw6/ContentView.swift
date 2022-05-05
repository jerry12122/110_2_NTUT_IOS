//
//  ContentView.swift
//  hw6
//
//  Created by jerry on 2022/5/4.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red: 0.5, green: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/, blue: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/)
            VStack{
                ZStack{
                    Color.white
                    VStack(alignment: .center){
                        VStack(alignment: .center){
                            LinearGradient(gradient: Gradient(colors: [.pink,.purple,.blue,.blue]), startPoint: .leading, endPoint: .trailing)
                                .frame(width: .infinity, height: 70, alignment: .top)
                                .mask(
                                    Image(systemName: "person.2.fill")
                                        .font(.system(size: 70)
                                        )
                                    )
                            Text("Health Sharing")
                                .font(.system(size: 36))
                                .bold()
                        }.padding()
                        VStack(alignment:.leading,spacing: 20){
                            HStack{
                                Image(systemName: "checklist")
                                    .font(Font.system(size: 45))
                                    .foregroundColor(.blue)
                                VStack(alignment: .leading){
                                    Text("You're in Control")
                                        .bold()
                                    Text("Keep friends and family up to date on how you're doing by securely sharing your Health data.")
                                        .foregroundColor(Color(red: 102/255, green: 102/255, blue: 102/255))
                                }
                            }
                            HStack{
                                Image(systemName: "bell.badge.fill")
                                    .font(Font.system(size: 45))
                                    .foregroundColor(.blue)
                                VStack(alignment: .leading){
                                    Text("Dashboard and Notifications")
                                        .bold()
                                    Text("Data you share will appear in their Health app. They can also get notifications if there's an update.")
                                        .foregroundColor(Color(red: 102/255, green: 102/255, blue: 102/255))
                                }
                            }
                            HStack{
                                Image(systemName: "lock.fill")
                                    .font(Font.system(size: 45))
                                    .foregroundColor(.blue)
                                VStack(alignment: .leading){
                                    Text("Private and secure")
                                        .bold()
                                    Text("Only a summary of each topic is shared, not the datails. Thee information is encrypted and you can stop sharing at any time.")
                                        .foregroundColor(Color(red: 102/255, green: 102/255, blue: 102/255))
                                }
                            }
                        }.padding()
                        VStack(alignment: .center){
                            Button("  Share with Someone  ") {
                                
                            }.font(.system(size: 25))
                            .foregroundColor(.white)
                                .background(.blue)
                                .cornerRadius(22.5)
                        }
                        
                        
                        Spacer()
                    }
                }.cornerRadius(15)
                    .padding()
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
