//
//  OptionsListView.swift
//  MemoryGame
//
//  Created by Marina Basaeva on 8/10/22.
//

import SwiftUI

struct ThemesListView: View {

    @StateObject private var themeViewModel = ThemeViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(themeViewModel.themes) { theme in
                    NavigationLink(destination: EmojiMemoryGameView(game: EmojiMemoryGame(theme: theme))) {
                        Text(theme.title)
                    }
                }
                
//                ForEach(themeViewModel.themes) { theme in
//
//                    NavigationLink {
//                        EmojiMemoryGameView(game: EmojiMemoryGame())
//
//                    } label: {
//
//                        Text(theme.title)
//
//                    }

//                }
            }
        }
    }
}

struct OptionsListView_Previews: PreviewProvider {
    static var previews: some View {
        ThemesListView()
    }
}
