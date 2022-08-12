//
//  SampleViewDeleteThisLater.swift
//  MemoryGame
//
//  Created by Marina Basaeva on 8/10/22.
//

import SwiftUI

struct SampleViewDeleteThisLater: View {
    
    var theme: Theme?
    
    var body: some View {
        Text(theme?.emojis[0] ?? "No Emoji to show")
    }
}

struct SampleViewDeleteThisLater_Previews: PreviewProvider {
    static var previews: some View {
        SampleViewDeleteThisLater()
    }
}
