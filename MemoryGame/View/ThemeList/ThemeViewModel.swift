//
//  ThemeViewModel.swift
//  MemoryGame
//
//  Created by Marina Basaeva on 8/10/22.
//

import Foundation
import SwiftUI

class ThemeViewModel: ObservableObject {
    
    @Published var themes: [Theme] = []
    
    init() {
        themes = presetThemes
    }
    
    
    var presetThemes: [Theme] {
        let animals = Theme(title: "Animals", emojis: ["🐱","🐶", "🐻", "🦁", "🐰","🦊","🐼","🐻‍❄️","🐨","🐯","🐮","🐷","🐸","🐵","🦆","🐺","🐗","🦋","🐌","🐝","🦂","🐢","🐞","🐙","🐴","🐳","🦔","🐿", "🐁", "🦩", "🦜"])
        
        let food = Theme(title: "Food", emojis: ["🍏", "🍐","🍋","🍌","🍉","🍇","🍓","🫐","🍈","🍒","🍑","🥭","🍍","🥥","🥝","🍅","🥑","🥦","🥬","🥒","🌶","🫑","🌽","🥕","🫒","🧄","🥐","🥯","🍞","🥨","🧀","🥞","🧇","🍗","🌭","🍔","🍟","🍕","🥪","🌮","🌯","🍜","🍝","🍣","🍚","🍦","🥫","🍩","🍪","🍿","🍵"])
        let vehicles = Theme(title: "Vehicles", emojis: ["🚗", "🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🦽","🦼","🛴","🚲","🛵","🏍","🛺","🚠","✈️","🚃","🚀","🚁","🛶","⛵️","🚤","🛥","🛳","⛴","🚢"])
        
        let sports = Theme(title: "Sports", emojis: ["⚽️", "🏀", "🏈","🥎","🎾","🏐","🏉","🥏","🎱","🪀","🏓","🏸","🏒","🏑","🥍","🏏","🪃","🏹","🎣","🥊","🥋","🛹","🛼","⛸","🎿","⛷","🏂","🪂","🏋️‍♀️","🤺","🧗‍♀️","🚴‍♂️"])
        
        return [animals, food, vehicles, sports]
    }
    
}
