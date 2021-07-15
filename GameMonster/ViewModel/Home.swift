//
//  Home.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/15/21.
//

import Foundation
import SwiftUI


public class Home: ObservableObject{
    
    
    @Published var show = false
    @Published var game = TTTGame()
    @Published var activeGame = ""
    
}
