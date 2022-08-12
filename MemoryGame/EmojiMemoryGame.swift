//
//  EmojiMemoryGame.swift
//  MemoryGame
//
//  Created by Marina Basaeva on 8/5/22.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    var theme: Theme
    var cards: [Card] {model.cards}
    
    @Published private var model: MemoryGame<String>
    
    init(theme: Theme) {
        self.theme = theme
        model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
 
    
    static func createMemoryGame(with theme: Theme) -> MemoryGame<String> {
        let emojis = theme.emojis.shuffled()
        
        return MemoryGame<String>(numberOfPairsOfCards: 8) { pairIndex in
            emojis[pairIndex]
            
        }
    }
   
//    var cards: Array<Card> {
//        model.cards
//    }
//
    // MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
}
