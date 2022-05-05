//
//  card.swift
//  card2
//
//  Created by jerry on 2022/3/16.
//  Copyright © 2022 student. All rights reserved.
//

import Foundation
struct Card{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier()->Int{
        identifierFactory+=1
        return identifierFactory
    }
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
