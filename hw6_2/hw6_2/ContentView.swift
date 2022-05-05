//
//  ContentView.swift
//  hw6_2
//
//  Created by jerry on 2022/5/4.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Image("images")
            HStack{
                Image(systemName: "applelogo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 25, height: 30)
                Text("News+")
                    .bold()
                    .font(.title)
            }
            Text("Great news!")
                .bold()
                .font(.title)
            Text("Audio stories are here.")
                .bold()
                .font(.title)
                .foregroundColor(.red)
            Text("Listen on in Apple News+.")
                .bold()
                .font(.title)
            Button(action: {}) {
                Text("Get Started")
                    .font(.headline)
                    .frame(maxWidth: 300)
            }
            .padding(10)
            .foregroundColor(.white)
            .background(.red)
            .cornerRadius(16)
            
            Text("Plan auto-renews for $9.99/month until canceled.")
                .font(.system(size:12))
                .foregroundColor(.gray)
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
