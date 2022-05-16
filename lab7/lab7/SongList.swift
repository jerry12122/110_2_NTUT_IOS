//
//  SongList.swift
//  lab7
//
//  Created by jerry on 2022/5/5.
//

import SwiftUI

struct SongList: View {
    let songs = [
    Song(name: "可惜沒如果", singer: "林俊傑",lyrics: "倘若那天 把該說的話好好說 該體諒的不執著 如果那天我 不受情緒挑撥 你會怎麼做 那麼多如果 可能如果我 可惜沒如果 只剩下結果"),
    Song(name: "稻香", singer: "周杰倫",lyrics: "还记得你说家是唯一的城堡 随着稻香河流继续奔跑 微微笑 小时候的梦我知道 不要哭让萤火虫带着你逃跑 乡间的歌谣永远的依靠 回家吧 回到最初的美好"),
    Song(name: "如果可以", singer: "韋禮安", lyrics: "如果可以 我想和妳回到那天相遇 讓時間停止 那一場雨 只想擁抱 妳在身邊的證據 吻妳的呼吸 一眨眼 一瞬間 妳說好就是永遠 不會變")
    ]
    var body: some View {
        NavigationView{
            List {
                ForEach(songs, id: \.name) { song in
                    NavigationLink{
                        SongDetail(song:song)
                    }label:{
                        SongRow(song: song)
                    }
                }
            }
            .navigationTitle("中文歌")
        }
    }
}

struct SongList_Previews: PreviewProvider{
    static var previews: some View {
    SongList()
        
    .previewLayout(.sizeThatFits)
    }
}
