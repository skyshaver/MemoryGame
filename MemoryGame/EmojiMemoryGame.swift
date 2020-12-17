//
//  EmojiMemoryGame.swift
//  MemoryGame
//
//  Created by Sky Shaver on 2020-12-11.
// view model

import Foundation
import SwiftUI

// observableobject only works for classes, makes object reactive, uses a publisher and a send function objectWillChange.send(), ObservableObjectPublisher
class EmojiMemoryGame: ObservableObject {
    // private(set) mddel only mutable by class, viewable by all views
    // use private with accessor and mutator
    // inline function / lambda thingy, types are inferred from function parameter, last parameter so it can split out to {}
    
    // @Published is a property wrapper that calls objectWillChange.send() whenever the model changes
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    // static makes it a function on the type, not the instance
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🦃", "💀", "🧟‍♂️", "🧛🏻‍♂️", "👺"]
        let randomInt = Int.random(in: 2...6)
        return MemoryGame<String>(numberOfPairsOfCards: randomInt) { pairIndex in
            return emojis[pairIndex] } // model for game
    }
    
    // MARK: - access to the model
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards // return is redundant on single line return funcs
    }
    
    // MARK: - Intent(s)
    // functions that allow views to mutate the model
    func chooseCard(card: MemoryGame<String>.Card) {
       // objectWillChange.send()
        model.choose(card: card)
    }
    
}
