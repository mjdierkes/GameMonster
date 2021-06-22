//
//  TTTGame.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/14/21.
//

import SwiftUI

struct MancalaGameView: View {
    
    @StateObject private var game = Mancala()
    
    var body: some View {
        VStack{
            Header()
            MancalaView()
            Audience()
            BottomBar()
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .padding()
        .environmentObject(game)
        .environmentObject(game as GameBoardRequestType)
        .task {
            for await session in PlayTogether.sessions() {
                game.configureGroupSession(session)
            }
        }
        
      
        
    }
}

struct MancalaGameView_Previews: PreviewProvider {
    static var previews: some View {
        TTTGame()
    }
}
