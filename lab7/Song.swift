//
//  Song.swift
//  lab7
//
//  Created by jerry on 2022/5/16.
//

import SwiftUI
struct Song{
    let id = UUID()
    let name: String
    let singer: String
    let lyrics: String
    
}

extension Song{
    static let DemoSong = Song(name: "可惜沒如果", singer: "林俊傑",lyrics: "倘若那天 把該說的話好好說 該體諒的不執著 如果那天我 不受情緒挑撥 你會怎麼做 那麼多如果 可能如果我 可惜沒如果 只剩下結果")
}
