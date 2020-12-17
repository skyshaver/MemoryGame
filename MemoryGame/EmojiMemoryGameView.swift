//
//  EmojiMemoryGameView.swift
//  MemoryGame
//
//  Created by Sky Shaver on 2020-12-11.
// view

// shuffle cards, make them the right size, random number of pairs from 2-6

import SwiftUI

struct EmojiMemoryGameView: View {
    // @ObservedObject ties to the @Published property on the view model
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        HStack {
            // ForEach is a container view
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    viewModel.chooseCard(card: card)
                }
                //.aspectRatio(2/3, contentMode: .fit)
            }
        }
        .padding()
        .foregroundColor(Color.orange)
        
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cardCorner).fill(Color.white)
                    RoundedRectangle(cornerRadius: cardCorner).stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                } else {
                    RoundedRectangle(cornerRadius: cardCorner).fill()
                        
                }
            }
            .font(Font.system(size: fontSize(for: geometry.size)))
        }
    }
    
    // MARK: - Drawing constants
    let cardCorner: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel:  EmojiMemoryGame())
    }
}
