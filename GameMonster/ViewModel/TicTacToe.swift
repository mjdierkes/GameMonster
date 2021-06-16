//
//  TicTacToe.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/14/21.
//

import Foundation
import SwiftUI
import Combine
import GroupActivities

public class TicTacToe: GameBoardRequestType {
    
    
    public let columns = [GridItem(.flexible()),
                          GridItem(.flexible()),
                          GridItem(.flexible())]

    private let generator = UINotificationFeedbackGenerator()
    private let profile = Profile()
    
    
    // Resets GameBoard back to initial state
    public override func reset() {
        moves = Array(repeating: nil, count: 9)
        audience = [Player]()

        isDisabled = false
        
        sendMessage(moves: moves, audience: audience)
    }
    
    public override func update(for move: Move) {
        validateMove(for: move)
    }
    
    // Clears everything from memory, for switching to another game
    public override func removeGame() {
        
    }
    
    public func updateProfile(name: String){
        profile.saveName(name)
    }
    
    @Published public var player = Player(id: UUID(), name: "Crazy Joe")
    
    init(){
        self.player = profile.getDefault(for: UUID())
        super.init(type: .TicTacToe)
    }
    
    
    

    
    // MARK: Move functions
    
    // Deprecated
    private func computerMove() {
        isDisabled = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
            let computerPosition = determineComputerMovePosition()
            validateMove(for: Move(mover: .opponent, boardIndex: computerPosition))
            isDisabled = false
        }
    }
    
    
    private func validateMove(for move: Move){
        
        let position = move.boardIndex
        if move.mover == .local { isDisabled = true }
        
        if updateGameStatus() != .undetermined{
            gameOver()
        }
        else if !isSquareOccupied(forIndex: position){
            moves[position] = Move(mover: move.mover, boardIndex: position)
            if move.mover == .local {
                //Update opponent on local move
                sendMessage(as: Move(mover: .opponent, boardIndex: position))
            }
        }


    }
    
    
    public override func flippedMoves() -> [Move?] {
        
        var newMoves: [Move?] = Array(repeating: nil, count: 9)
        for move in moves {
            if let move = move {
                if move.mover == .local {
                    newMoves.append(Move(mover: .opponent, boardIndex: move.boardIndex))
                }
                else {
                    newMoves.append(Move(mover: .local, boardIndex: move.boardIndex))
                }
            }
        }
        
        return newMoves
    }
    
    
    
    
    
    
    
    
    
    // MARK: Check win conditions
    
    private func updateGameStatus() -> GameStatus{
        
        if checkWinCondition(for: .local){
            return .local
        }
        
        if checkWinCondition(for: .opponent){
            print("\(opponent.name) Wins!")
            return .opponent
        }
        
        if(isDraw()){
            print("It's a draw!")
            return .draw
        }
        
        return .undetermined
        
    }
    
    private func gameOver() {
        isDisabled = true
        if updateGameStatus() == .local {
            generator.notificationOccurred(.success)
            wins += 1
        }
        print("Game Over")
    }
    
    
    
    private func checkWinCondition(for mover: Mover) -> Bool {
        // All possible win conditions for game
        let winPatterns: Set<Set<Int>> = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
        
        let playerMoves = moves.compactMap { $0 }.filter{ $0.mover == mover }
        let playerPositions = Set(playerMoves.map { $0.boardIndex })
        
        // Player wins if their positions match a win pattern
        for pattern in winPatterns where pattern.isSubset(of: playerPositions) { return true }

        
        // Player did not win
        return false
    }
    
    
    // Checks for a draw
    private func isDraw() -> Bool {
        print(moves.compactMap { $0 }.count)
        return moves.compactMap { $0 }.count == 9
    }
    

    // Checks if the the position is occupied
    private func isSquareOccupied(forIndex index: Int) -> Bool {
        return moves.contains(where: {$0?.boardIndex == index})
    }
    
    
    
    // TODO: Replace with Group Session listener
    private func determineComputerMovePosition() -> Int{
        
        var movePosition = Int.random(in: 0..<9)
        if(!isDraw()){
            while isSquareOccupied(forIndex: movePosition){
                movePosition = Int.random(in: 0..<9)
            }
        }
       
        return movePosition
    }
    
}
