//
//  GameView.swift
//  GameMonster
//
//  Created by Mason Dierkes on 7/16/21.
//

import SwiftUI

struct GameView: View {
    
    @State private var game = GameBoardRequestType()
    public var gameType: GameType
    
    var body: some View {
        VStack{
            Header()
            
            switch gameType {
            case .TicTacToe:
                TTTBoardView()
                    .environmentObject(TicTacToe())
            case .ConnectFour:
                ConnectBoardView()
                    .environmentObject(ConnectFour())
            case .Mancala:
                MancalaView()
                    .environmentObject(Mancala())
            default:
                Text("Game not correctly specified")
            }
            
            Audience()
            BottomBar()
        }
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

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(gameType: .TicTacToe)
    }
}
