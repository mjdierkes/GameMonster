//
//  GameBoard.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/14/21.
//

import Foundation
import Combine
import GroupActivities

public protocol GameBoard: ObservableObject {
    
    var name: String { get }
    
    var isDisabled: Bool { get set }
    var moves: [Move?] { get set }
    
    var audience: [Player] { get set }
    var opponent: Player { get set }
    
    
    func reset()
    
    func update(for move: Move)

    func removeGame()
    
    
}


public class GameBoardRequestType: GameBoard, ObservableObject{
    
    public let type: GameType

    // Game modifiers
    @Published public var isDisabled = false
    @Published public var moves: [Move?] = Array(repeating: nil, count: 9)
    
    @Published public var audience = [Player]()
    @Published public var opponent = Player(id: UUID(), name: "Default")
    @Published public var wins = 0
    
    public var name: String {
        switch type {
        case .TicTacToe:
            return "TicTacToe"
        case .Chess:
            return "Chess"
        case .Connect4:
            return "Connect4"
        }
    }
    
    
    public init(type: GameType){
        print("Super init")
        self.type = type
    }
    
    public func reset(){}
    
    public func update(for move: Move){}

    public func removeGame(){}
    
    public func flippedMoves() -> [Move?]{ return moves }
    
    
    public var tasks = Set<Task.Handle<Void, Never>>()
    public var subscriptions = Set<AnyCancellable>()
    
    public var messenger: GroupSessionMessenger?
   
    @Published public var session: GroupSession<PlayTogether>?
    
    
}

public enum GameStatus {
    case local, opponent, draw, undetermined
}

public enum GameType {
    case TicTacToe, Chess, Connect4
}
