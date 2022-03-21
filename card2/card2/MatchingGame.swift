//
//  MatchingGame.swift
//  card2
//
//  Created by jerry on 2022/3/16.
//  Copyright © 2022 student. All rights reserved.
//

import Foundation
class MatchingGame{
    var cards: Array<Card> = Array()

    func chooseCard(at index: Int){
        
    }
    init(numberOfPairsOfCards: Int){
        for i in 1...numberOfPairsOfCards{
            let card = Card(identifier: i)
            cards += [card,card]
        }
        
    }
}
