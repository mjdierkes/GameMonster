//
//  ConnectFour.swift
//  GameMonster
//
//  Created by Mason on 6/27/21.
//

import Foundation
import SwiftUI

public final class ConnectFour: GameBoardRequestType {
    
    @Published private(set) var board: [[Token]]
    @Published public var activePlayer: ActivePlayer = .red
    
    
    public init(columns: Int = 7, rows: Int = 6){
        let emptyRow = [Token](repeating: .empty, count: rows)
        board = [[Token]](repeating: emptyRow, count: columns)
        super.init()
    }
    
    
    public func update(at column: Int){
        guard (0..<board.count) ~= column,
              let row = board[column].lastIndex(of: .empty)
              else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.impactGenerator.impactOccurred()
        }
        board[column][row] = activePlayer.cell
        activePlayer.toggle()
        
    }
    
    public override func reset(){
        board = board.map{ $0.map { _ in return .empty }}
        activePlayer = .red
    }
    
    public var winner: ActivePlayer? {
        for player in ActivePlayer.allCases {
            // Check horizontal win
            for x in 0..<board.count - 3 {
                for y in 0..<board[0].count {
                    if board[x][y] == player.cell,
                        board[x + 1][y] == player.cell,
                        board[x + 2][y] == player.cell,
                        board[x + 3][y] == player.cell {
                        isDisabled = true
                        return player
                    }
                }
            }

            // Check vertical win
            for x in 0..<board.count {
                for y in 0..<board[0].count - 3 {
                    if board[x][y] == player.cell,
                        board[x][y + 1] == player.cell,
                        board[x][y + 2] == player.cell,
                        board[x][y + 3] == player.cell {
                        isDisabled = true
                        return player
                    }
                }
            }

            // Check for diagonal ascending win
            for x in 0..<board.count - 3 {
                for y in 3..<board[0].count {
                    if board[x][y] == player.cell,
                        board[x + 1][y - 1] == player.cell,
                        board[x + 2][y - 2] == player.cell,
                        board[x + 3][y - 3] == player.cell {
                        isDisabled = true
                        return player
                    }
                }
            }

            // Check for diagonal ascending win
            for x in 0..<board.count - 3 {
                for y in 0..<board[0].count - 3 {
                    if board[x][y] == player.cell,
                        board[x + 1][y + 1] == player.cell,
                        board[x + 2][y + 2] == player.cell,
                        board[x + 3][y + 3] == player.cell {
                        isDisabled = true
                        return player
                    }
                }
            }
        }
        return nil
    }
    
}
