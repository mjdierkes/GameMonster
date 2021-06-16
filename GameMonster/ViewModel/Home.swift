//
//  Home.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/15/21.
//

import Foundation


public class Home: ObservableObject{
    
    
    @Published public var games: [Game] =
        
        [
            Game(name: "Tic Tac Toe", coverImage: nil),
            Game(name: "Connect 4", coverImage: nil),
            Game(name: "Chess", coverImage: nil)
        
        ]
    
}
