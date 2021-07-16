//
//  MancalaView.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/21/21.
//

import SwiftUI

struct MancalaView: View {
    
    @EnvironmentObject var game: Mancala
    
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(Color("Offwhite"))
                .frame(width: 150, height: 400)
            
            VStack{
                StoreView(stones: game.localMoves[0].stones)
                HStack{
                    VStack{
                        ForEach(game.localMoves) { move in
                            if move.boardIndex != 0 {
                                Pocket(for: move)
                                    .onTapGesture(perform: { game.update(for: move) })
                            }
                        }
                    }
                    VStack{
                        ForEach(game.opponentMoves.reversed()){ move in
                            if move.boardIndex != 7 {
                                Pocket(for: move)
                                    .onTapGesture(perform: { game.update(for: move) })
                            }
                        }
                    }
                }
                StoreView(stones: game.opponentMoves[0].stones)
            }
            
        }
        
    }
}

struct MancalaView_Previews: PreviewProvider {
    static var previews: some View {
        MancalaView()
    }
}
