//
//  Game.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/15/21.
//

import Foundation
import SwiftUI

/// Provides structure for how a Game can be displayed to the user.
/// This information is displayed on the homepage and with Group Activities.
public class Game: Identifiable, ObservableObject{
    public var id = UUID()
    
    public let name: String
    public let coverImage: Image?
    
    public init(name: String, coverImage: Image?){
        self.name = name
        self.coverImage = coverImage
    }
    
    private let defaults = UserDefaults.standard

    // The number of wins that a player has.
    // Displayed on homepage and shared with friends.
    var wins: Int {
        get { return defaults.integer(forKey: name) }
        set { defaults.set(wins + newValue, forKey: name) }
    }

}

/// All the different Games available in Game Monster
public enum GameType {
    case TicTacToe, Mancala, ConnectFour
}
