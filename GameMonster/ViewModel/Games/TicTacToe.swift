//
//  TicTacToe.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/14/21.
//

import Foundation
import SwiftUI
import AVKit



public class TicTacToe: GameBoardRequestType {
    
    public let columns = [GridItem](repeating: GridItem(.flexible()), count: 3 )
    
    private let profile = Profile()
    
    // Resets GameBoard back to initial state
    public override func reset() {
        moves = Array(repeating: nil, count: 9)
        audience = [Player]()

        isDisabled = false
        
        sendMessage(moves: moves, audience: audience)
    }
    
    public func update(for move: TTTMove) {
        validateMove(for: move)
    }
    
    // Clears everything from memory, for switching to another game
    public override func removeGame() {
        
    }

    
    override init(){
        super.init()
        self.player = profile.getDefault(for: UUID())
    }
    
    

    
    // MARK: Move functions
    
    // Deprecated
    private func computerMove() {
        isDisabled = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
            let computerPosition = determineComputerMovePosition()
            validateMove(for: TTTMove(mover: .opponent, boardIndex: computerPosition))
            isDisabled = false
        }
    }
    
    
    private func validateMove(for move: TTTMove){
        
        let position = move.boardIndex
        if move.mover == .local { isDisabled = true }
        
        if updateGameStatus() != .undetermined {
            gameOver()
        }
        
        else if !isSquareOccupied(forIndex: position){
            moves[position] = TTTMove(mover: move.mover, boardIndex: position)
            impactGenerator.impactOccurred()
            playSound(name: "SquareSoundEffect", type: "wav")
            
            if move.mover == .local {
                //Update opponent on local move
                sendMessage(as: TTTMove(mover: .opponent, boardIndex: position))
                if updateGameStatus() == .local {
                    gameOver()
                }
            }
        }


    }
    
    
    public override func flippedMoves() -> [TTTMove?] {
        
        var newMoves: [TTTMove?] = moves
        for i in 0..<moves.count {
            if let move = moves[i] {
                if move.mover == .local {
                    newMoves[i] = TTTMove(mover: .opponent, boardIndex: move.boardIndex, isWinning: move.isWinning)
                }
                else {
                    newMoves[i] = TTTMove(mover: .local, boardIndex: move.boardIndex, isWinning: move.isWinning)
                }
            }
        }

        return newMoves
    }
    
    
    
    
    
    
    
    
    
    // MARK: Check win conditions
    
    private func updateGameStatus() -> GameStatus{
        
        if checkWinCondition(for: .local){
            print("\(player.name) Wins!")
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
            
            playSound(name: "winSoundEffect", type: "wav")
        }
        print("Game Over")
    }
    
    private func updateWinningMoves(with pattern: Set<Int>) {
        for i in pattern {
            moves[i]?.isWinning = true
        }
        sendMessage(moves: flippedMoves(), audience: audience)
    }
    
    
    private func checkWinCondition(for mover: Mover) -> Bool {
        // All possible win conditions for game
        let winPatterns: Set<Set<Int>> = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
        
        let playerMoves = moves.compactMap { $0 }.filter{ $0.mover == mover }
        let playerPositions = Set(playerMoves.map { $0.boardIndex })
        
        // Player wins if their positions match a win pattern
        for pattern in winPatterns where pattern.isSubset(of: playerPositions) {
            updateWinningMoves(with: pattern)
            return true
        }

        
        // Player did not win
        return false
    }
    
    
    // Checks for a draw
    private func isDraw() -> Bool {
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
    
    
    private func playSound(name: String, type: String){
        guard let url = Bundle.main.url(forResource: name, withExtension : type) else { print("Unable to locate Sound file"); return}

        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Unable to play sound")
        }
    }
    
    
}


    


