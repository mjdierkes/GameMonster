//
//  Game.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/15/21.
//

import Foundation
import SwiftUI

public class Game: Identifiable, ObservableObject{
    public var id = UUID()
    
    let name: String
    let coverImage: Image?
    
    public init(name: String, coverImage: Image?){
        self.name = name
        self.coverImage = coverImage
    }
    
    
    let defaults = UserDefaults.standard

    var wins: Int { return defaults.integer(forKey: name) }
    
    
    public func incrementWins() {
        defaults.set(wins + 1, forKey: name)
    }
    
}
