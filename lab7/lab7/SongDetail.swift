//
//  SongDetail.swift
//  lab7
//
//  Created by jerry on 2022/5/5.
//

import SwiftUI
struct SongDetail: View {
let song: Song

var body: some View {
    VStack {
            Image(song.name)
            .resizable()
            .scaledToFit()
            Text(song.lyrics)
            .padding()
        }
        .navigationTitle(song.name)

    }
}
struct SongDetail_Previews: PreviewProvider {
    static var previews: some View {
        SongDetail(song: .DemoSong)
    }
}
