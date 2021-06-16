//
//  TTTGame.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/14/21.
//

import SwiftUI

struct TTTGame: View {
    
    @StateObject private var game = TicTacToe()
    
    var body: some View {
        VStack{
            Header()
            TTTBoardView()
            Audience()
            BottomBar()
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .padding()
        .environmentObject(game)
        .task {
            for await session in PlayTogether.sessions() {
                game.configureGroupSession(session)
            }
        }
    }
}

struct TTCGame_Previews: PreviewProvider {
    static var previews: some View {
        TTTGame()
    }
}
