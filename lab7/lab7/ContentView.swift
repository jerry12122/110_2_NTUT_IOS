//
//  ContentView.swift
//  lab7
//
//  Created by jerry on 2022/5/11.
//

import SwiftUI

struct ContentView: View {
    let songs = [
            "可惜沒如果",
            "稻香",
            "如果可以",
        ]
    var body: some View {
        TabView {
            VStack {
                        ScrollView(.horizontal) {
                            let rows = [GridItem()]
                            LazyHGrid(rows: rows) {                ForEach(songs.indices, id: \.self) { item in
                                    SongView(song: songs[item], number: item + 1)
                                }
                            }
                        }
                        .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                SongList()
                    }
            
                .tabItem {
                    Label("中文歌", systemImage: "play")
                }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Image("可惜沒如果")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipped()
                    Image("稻香")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipped()
                    Image("如果可以")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipped()
                    
                }
            }
                .tabItem {
                    Label("圖片", systemImage: "camera")

                }
            VStack{
            Link("可惜沒如果", destination: URL(string: "https://www.youtube.com/watch?v=vsBf_0gDxSM")!)
            Link("稻香", destination: URL(string: "https://www.youtube.com/watch?v=sHD_z90ZKV0")!)
                Link("如果可以", destination: URL(string: "https://www.youtube.com/watch?v=8MG--WuNW1Y")!)
            }
                    .tabItem {
                    Label("來源", systemImage: "iphone.circle")

                }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
