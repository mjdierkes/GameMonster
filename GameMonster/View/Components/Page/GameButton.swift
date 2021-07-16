//
//  GameButton.swift
//  GameMonster
//
//  Created by Mason Dierkes on 7/13/21.
//

import SwiftUI

struct GameButton: View {
    
    public let game: Game
    public var isActive = false
    
    var body: some View {
        VStack{
            ZStack{
                
                if isActive {
                    PulseAnimation()
                }

                RoundedRectangle(cornerRadius: 19)
                    .foregroundColor(Color("Offwhite"))
                    .frame(width: 100, height: 100)
                
                if game.wins > 0 {
                    HStack{
                        Text("\(game.wins)")
                            .bold()
                            .font(.system(size: 12))
                            .offset(x: 5)
                        Image(systemName: "crown.fill")
                            .resizable()
                            .foregroundColor(Color.yellow)
                            .frame(width: 15, height: 12)
                    }
                    .offset(x: 22, y: -32)
                }
                
            }
           
            Text(game.name)
                .font(.subheadline)
                .bold()
        }
        
        .accentColor(Color.black)
    }
}


struct PulseAnimation: View {
    
    let color = Color.green
    @State private var animate = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25).fill(color.opacity(0.25)).frame(width: 115, height: 115).scaleEffect(self.animate ? 1:0.75)
        }
        .onAppear(perform: {
            withAnimation(Animation.linear(duration: 1.0).repeatForever(autoreverses: true)){
                self.animate.toggle()
            }
        })
        
    }
}



struct GameButton_Previews: PreviewProvider {
    private static let game: Game = Game(name: "Tic Tac Toe", coverImage: nil)
    static var previews: some View {
        GameButton(game: game)
    }
}
