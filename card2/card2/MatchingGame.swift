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
    //var indexAndOneAndOnlyFaceUpCard:Int?
    var flipCount:Int
    var isFlipAll:Bool
    var emojiChoices:Array<String> = Array()
    var indexAndOneAndOnlyFaceUpCard:Int?{
        get{
            var foundIndex:Int?
            for index in cards.indices{
                if cards[index].isFaceUp,!cards[index].isMatched{
                    if foundIndex == nil{
                        foundIndex = index
                    }
                    else{
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set{
            for index in cards.indices{
                if !cards[index].isMatched{
                    cards[index].isFaceUp = (index == newValue)
                }
            }
        }
    }
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexAndOneAndOnlyFaceUpCard,matchIndex != index{
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                
            }else if let matchIndex = indexAndOneAndOnlyFaceUpCard,matchIndex == index{
                cards[index].isFaceUp = false
            }
            else{
                indexAndOneAndOnlyFaceUpCard = index
            }
            flipCount += 1
        }
    }
    func flipAll(status : Bool){
        flipCount = 0
        for index in cards.indices{
            cards[index].isFaceUp = !status
            cards[index].isMatched = false
        }
        isFlipAll = !status
    }
    init(numberOfPairsOfCards: Int , emoji:Array<String>){
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
        var Rcards: Array<Card> = Array()
        while(!cards.isEmpty){
            let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
            Rcards.append(cards[randomIndex])
            cards.remove(at: randomIndex)
        }
        emojiChoices = emoji
        cards = Rcards
        flipCount = 0
        isFlipAll = false
    }
}
