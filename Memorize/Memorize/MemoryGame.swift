//
//  MemoryGame.swift
//  Memorize
//
//  Created by Daniel Nguyen on 8/13/20.
//  Copyright © 2020 Daniel Nguyen. All rights reserved.
//

// This is the Model. It defines the Card game but there is no UI
// associated with this Swift Struct. It will interact with the ViewModel and
// View will be used to "model" this Model. This model will be glued by the ViewModel
// to the View. 


import Foundation

struct MemoryGame<CardContent> {
    
    var cards : Array<Card>
    
    func choose(card: Card) {
        print("card chosen: \(card)")
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card : Identifiable {
        var isFaceUp : Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
     
}
