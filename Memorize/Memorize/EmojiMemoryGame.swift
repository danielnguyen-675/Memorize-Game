//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Daniel Nguyen on 8/13/20.
//  Copyright © 2020 Daniel Nguyen. All rights reserved.
//

// This is the ViewModel of the MVVM Architecture. It knows how the the View is going
// to be drawn on the screen. The job of the ViewModel is to take the UI independent model
// and translate it so it can be displayed in some way. Such as a EmojiMemoryGame.
// A viewModel is a portal between the Viewsand the Model. A way for the view to access the Model. (Doorway)
// for the view to get to the model.
// Imagine there's a house, inside this house are all of our Views and they live there. This ViewMODEL (EmojiMemoryGame) is the front door, esentially, they are doorways to the Model (outside world). All views will look through the same doorway (EmojiMemoryGame) and they see the same exact model.
// Biggest problem : It's wide open.
// How do we fix it? can close the door such as "private var model: MemoryGame<String>", but now none of the views can look outsdie the door. Model is inaccessible to the views.
// Middle ground solution: "private (set) var model: MemoryGame<String>" think of it like a glass door, can see through it, but cant modify the model.
//This is where Intents come in. Interpret user input.

import SwiftUI

// Biggest advantage of a class. it lives in the heap and has pointers to it.
// The ViewModel will be a class because all of our Views can have pointers to the ViewModel class.
// These views are going to look through the ViewModel and see the model. Views will have pointers to the EmojiMemoryClass (portal) to the Model.

class EmojiMemoryGame {
    
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
   static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻","🤖",""]
    return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
        
    //Video doorbell. Provide vars and funcs to let people look at this model through
    //constricted ways. Views can see the cards in the Model.
    // We want our views ot be simple as possible, viewmodel's jopb to present the model to the views in a way that is easily consumable by the views.
    // Mark - Access to the Model.
    var cards : Array<MemoryGame<String>.Card> {
        model.cards //Returns the Model's array of Cards.
    }
    
    // Mark - Intent(s) - Letting all of the Views know "heres what you can do to change the model"
    //Like a high-tech door with a intercom button taht can talk to the model. The views will use the "intercom" such as using a function as chooseCard
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
}

