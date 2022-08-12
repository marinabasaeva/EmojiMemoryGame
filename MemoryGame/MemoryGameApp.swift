//
//  MemoryGameApp.swift
//  MemoryGame
//
//  Created by Marina Basaeva on 8/3/22.
//

import SwiftUI

@main
struct MemoryGameApp: App {
    private let game = EmojiMemoryGame(theme: ThemeViewModel().themes[0])
    
    var body: some Scene {
        WindowGroup {
            ThemesListView()
//            EmojiMemoryGameView(game: game)
        }
    }
}
