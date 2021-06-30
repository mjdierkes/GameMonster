//
//  ConnectFour.swift
//  GameMonster
//
//  Created by Mason on 6/27/21.
//

import Foundation
import SwiftUI

public class ConnectFour: GameBoardRequestType {
    
    public static let width = 7
    public static let height = 6
    
    public let columns = [GridItem](repeating: GridItem(.flexible()), count: ConnectFour.width)
    @Published public var slots: [ChipColor]
    
    
    private var board = ConnectFourModel()
    
    
    public init(){
        slots = board.slots
        super.init(type: .ConnectFour)
    }
    
    
    public func update(for move: ConnectMove) {
        
        print("Update Called For: \(move.boardIndex)")
        if let row = board.nextEmptySlot(in: move.column) {
            if move.mover == .local {  board.add(chip: .red, in: move.column) }
            else if move.mover == .opponent {  board.add(chip: .yellow, in: move.column) }
        }
        
        slots = board.slots
        
    }
    
    
    
    
}
