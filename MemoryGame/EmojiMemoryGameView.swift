//
//  EmojiMemoryGameView.swift
//  MemoryGame
//
//  Created by Marina Basaeva on 8/3/22.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var game: EmojiMemoryGame
    @State var currentDate = Date()
    @State var timeRemaining = 100
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            gameBody
            timerView
            newGame
        }
//        .padding(.top, 15)
        .padding()
    }
    
    
    var gameBody: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
            if card.isMatched && !card.isFaceUp {
                Color.clear
            } else {
                CardView(card: card)
                    .padding(4)
                    .transition(AnyTransition.asymmetric(insertion: .scale, removal: .opacity))
                    .onTapGesture {
                        withAnimation{
                            game.choose(card)
                        }
                    }
            }
        }
        .foregroundColor(.blue)
    }
    
    var timerView: some View {

            Text("Time: \(timeRemaining)")
                .onReceive(timer) { _ in
                    if timeRemaining > 0 {
                        timeRemaining -= 1
                    }
                }

    }
    
    var newGame: some View {
        Button(action: {
            withAnimation {
                game.newGame()
                
            }
        }) {
            Text("New Game")
                .foregroundColor(.white)
                .padding(.horizontal, 30)
                .padding(.vertical, 15)
                .background(RoundedRectangle(cornerRadius: 15).fill(.red))
                
        }
        .padding(.top, 10)
    }
    
}

struct CardView: View {
   let card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader {geometry in
            ZStack {
//                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90))
//                    .padding(5).opacity(0.5)
                Text(card.content)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                    .font(Font.system(size: DrawingConstants.fontSize))
                    .scaleEffect(scale(thaFits: geometry.size))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    private func scale(thaFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let fontScale: CGFloat = 0.7
        static let fontSize: CGFloat = 32
    }
}

















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame(theme: ThemeViewModel().themes[0])
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(game: game)
    }
}
