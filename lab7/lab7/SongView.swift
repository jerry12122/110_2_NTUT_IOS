//
//  SongView.swift
//  lab7
//
//  Created by jerry on 2022/5/5.
//

import SwiftUI
struct SongView: View {
    let song: String
    let number: Int
    
    var body: some View {
        VStack {
            Image(song)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .clipped()
            Text(song)
        }
        .overlay(alignment: .topLeading, content: {
            NumberImage(number: number)
        })
    }
}
