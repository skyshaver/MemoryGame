//
//  MemoryGameApp.swift
//  MemoryGame
//
//  Created by Sky Shaver on 2020-12-11.
//

import SwiftUI

@main
struct MemoryGameApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
