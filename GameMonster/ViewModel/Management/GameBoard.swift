//
//  GameBoard.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/14/21.
//

import Foundation
import Combine
import GroupActivities
import SwiftUI
import AVKit

public protocol GameBoard: ObservableObject {
    
    var name: String { get }
    
    var isDisabled: Bool { get set }
    var moves: [TTTMove?] { get set }
    
    var audience: [Player] { get set }
    var opponent: Player { get set }
    
    
    func reset()
    
    func update(for move: Move)

    func removeGame()
    
    
}


public class GameBoardRequestType: GameBoard, ObservableObject{
    
//    public let type: GameType
    public let impactGenerator = UIImpactFeedbackGenerator(style: .light)

    private let profile = Profile()
    internal let generator = UINotificationFeedbackGenerator()
    internal var audioPlayer: AVAudioPlayer?
    
    // Game modifiers
    @Published public var isDisabled = false
    @Published public var moves: [TTTMove?] = Array(repeating: nil, count: 9)
    
    @Published public var audience = [Player]()
    @Published public var player = Player(id: UUID(), name: "Default")
    @Published public var opponent = Player(id: UUID(), name: "Default")
    @Published public var wins = 0
    
    public let name: String  = "Tic Tac Toe"
    
//    public var name: String {
//        switch type {
//        case .TicTacToe:
//            return "Tic Tac Toe"
//        case .Mancala:
//            return "Mancala"
//        case .ConnectFour:
//            return "Connect Four"
//        }
//    }
//    
//    
//    public init(type: GameType){
//        self.type = type
//    }
    
    
    public init() {
        
    }
    
    public func reset(){
        print("reset")
        reset()
    }
    
    public func update(for move: Move){}

    public func removeGame(){}
    
    public func flippedMoves() -> [TTTMove?]{ return moves }
    
    public func updateProfile(name: String){
        profile.saveName(name)
    }
    
//    private enum moveParsingError: Error {
//        case spaceUnavailable
//    }

    public var taskks = Set<Task<Any, Error>>
    public var tasks = Set<Task<Any, Error>.Handle<Void, Never>>()
    public var subscriptions = Set<AnyCancellable>()
    
    public var messenger: GroupSessionMessenger?
   
    @Published public var session: GroupSession<PlayTogether>?
    
    
}

public enum GameStatus {
    case local, opponent, draw, undetermined
}

