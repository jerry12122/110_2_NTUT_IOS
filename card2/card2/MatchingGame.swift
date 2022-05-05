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
    var score:Int
    
    var emoji_choices = [["🤡","💩","🥵","🥴","🤢","🤑","😈","👺"],
                         ["🐶","🐱","🐭","🐮","🐒","🦄","🐷","🦊"],
                         ["🍎","🍓","🍌","🍊","🍉","🍒","🍑","🥑"],
                         ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🎱"]]
    var emoji_theme = ["faces","animals","fruits","balls"]
    
    var emojiChoices: Array<String> = Array()
    var emojiTheme:String
    
    var themeIndex:Int
    
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
                    score = score + 30
                }
                else{
                    score = score - 10
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
        if !status{
            score = score - 1000
        }
        flipCount = 0
        for index in cards.indices{
            cards[index].isFaceUp = !status
            cards[index].isMatched = false
        }
        isFlipAll = !status
    }
    init(numberOfPairsOfCards: Int ){
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
        /*
         var Rcards: Array<Card> = Array()
         while(!cards.isEmpty){
         let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
         Rcards.append(cards[randomIndex])
         cards.remove(at: randomIndex)
         }
         = Rcards
         */
        cards = cards.shuffled()
        flipCount = 0
        isFlipAll = false
        score = 0
        themeIndex = Int.random(in: 0...3)
        emojiChoices = emoji_choices[themeIndex]
        emojiTheme = emoji_theme[themeIndex]
    }
}

