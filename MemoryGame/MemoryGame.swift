//
//  MemoryGame.swift
//  MemoryGame
//
//  Created by Sky Shaver on 2020-12-11.
//
// model in mvvm
import Foundation

// CardContent is a <T> here

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    // mutating is onlny needed in structs as they're value types
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        let chosenIndex: Int = index(of: card)
        cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0 // TODO: bogus!!
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex) // type is inferred
            cards.append(Card(id:pairIndex * 2, content: content))
            cards.append(Card(id:pairIndex * 2 + 1, content: content))
        }
        cards.shuffle()
    }
    
    
    // access is via . so MemoryGame.Card
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
