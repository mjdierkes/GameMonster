//
//  Manacala.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/19/21.
//

import Foundation

public class Mancala: GameBoardRequestType {

    private var manMoves = [MancalaMove]()
    
    @Published public var localMoves = [MancalaMove]()
    @Published public var opponentMoves = [MancalaMove]()

    // Resets GameBoard back to initial state
    public override func reset() {
        for i in 0..<15 {
            // Start of local Moves
            if i == 0 {
                manMoves.append(MancalaMove(mover: .local, boardIndex: i, stones: 0))
            }
            // Start of opponent Moves
            else if i == 7 {
                manMoves.append(MancalaMove(mover: .local, boardIndex: i, stones: 0))
            }
            else {
                manMoves.append(MancalaMove(mover: .local, boardIndex: i, stones: 4))
            }
        }

        localMoves = manMoves.chunked(into: 7)[0]
        opponentMoves = manMoves.chunked(into: 7)[1]
    
    }
    
    public func update(for move: MancalaMove) {
        preformMove(forIndex: move.boardIndex, mover: move.mover)
    }
    
    // Clears everything from memory, for switching to another game
    public override func removeGame() {
        
    }
    
        
    
    init(){
        super.init(type: .Mancala)
        reset()
    }


    private func preformMove(forIndex index: Int, mover: Mover){
        var position = index
        var moveCount = manMoves[position].stones
        
        var startIndex: Int {
            if mover == .opponent { return 0 }
            else { return 7 }
        }
        
        // Take stones from selected pocket
        manMoves[position].stones = 0
        position += 1
        
    
        // Place a stone into each pocket
        while moveCount > 0 {
            print(position)
            manMoves[position].stones += 1
//            if position != startIndex { manMoves[position].stones += 1 }
//            else { moveCount += 1 }
            
            if position == manMoves.count - 1 { position = 0 }
            
            position += 1
            moveCount -= 1
        }
        
        // Check game status
        print(updateGameStatus())
        
        // Separate moves into respected Arrays
        localMoves = manMoves.chunked(into: 7)[0]
        opponentMoves = manMoves.chunked(into: 7)[1]
    }
    
    private func updateGameStatus() -> GameStatus {
        
        var localSum = 0, opponentSum = 0
        
        for i in 1..<localMoves.count {
            
            if localMoves[i].stones != 0 {
                return .undetermined
            }
            
            if opponentMoves[i].stones != 0 {
                return .undetermined
            }
            
            localSum += localMoves[i].stones
            opponentSum += opponentMoves[i].stones
        }
        
        if localSum > opponentSum { return .local }
        else { return .opponent }
        
    }
    
    
    
    
    
    
}


extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
