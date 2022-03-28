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
    var indexAndOneAndOnlyFaceUpCard:Int?
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexAndOneAndOnlyFaceUpCard,matchIndex != index{
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexAndOneAndOnlyFaceUpCard = nil
            }else if let matchIndex = indexAndOneAndOnlyFaceUpCard,matchIndex == index{
                cards[index].isFaceUp = false
                indexAndOneAndOnlyFaceUpCard = nil
            }
            else{
                for flipDownIndex in cards.indices{
                    if !cards[flipDownIndex].isMatched{
                        cards[flipDownIndex].isFaceUp = false
                    }
                }
                cards[index].isFaceUp = true
                indexAndOneAndOnlyFaceUpCard = index
            }
        }
    }
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
        
    }
}
