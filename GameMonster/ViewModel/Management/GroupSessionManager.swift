//
//  GroupSessionManager.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/14/21.
//

import Foundation
import GroupActivities
import Combine
import SwiftUI

public extension GameBoardRequestType {
    
    
    /// Send messages.
    func sendMessage(as move: TTTMove){
        if let messenger = messenger {
            async {
                do {
                    try await messenger.send(MoveMessage(move: move))
                } catch {
                print("Unable to process request")
                }
            }
        }
    }
    
    func sendMessage(moves: [TTTMove?], audience: [Player]){
        if let messenger = messenger {
            async {
                do {
                    try await messenger.send(BoardMessage(moves: moves, audience: audience))
                } catch {
                print("Unable to send board message")
                }
            }
        }
    }
    
    func configureGroupSession(_ groupSession: GroupSession<PlayTogether>){
        print("Group Session Configured")
        reset()
        
        let messenger = GroupSessionMessenger(session: groupSession)
        self.messenger = messenger
        self.session = groupSession
        
        /// Updates late joiners on status of board and active players.
        groupSession.$activeParticipants
            .sink{ [self] activeParticipants in
                sendMessage(moves: flippedMoves(), audience: audience)
            }
            .store(in: &subscriptions)
        
        /// Listens for messages on the network.
        let moveTask = detach { [weak self] in
            for await (message, _) in messenger.messages(of:
                MoveMessage.self) {
                self?.handle(message)
            }
        }
        tasks.insert(moveTask)
        
        let boardTask = detach { [weak self] in
            for await (message, _) in messenger.messages(of:
                BoardMessage.self) {
                self?.handle(message)
            }
        }
        tasks.insert(boardTask)
        
        groupSession.join()
    }
    
    func openFaceTime(){
        
        if let facetimeURL:NSURL = NSURL(string: "facetime://user@example.com") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(facetimeURL as URL)) {
                application.open(facetimeURL as URL);
            }
          }
        
    }
    
    
    /// Process the input messages and handle accordingly.
    private func handle(_ message: MoveMessage){
        DispatchQueue.main.async { [self] in
            update(for: message.move)
            isDisabled = false
        }
    }
    
    private func handle(_ message: BoardMessage){
        DispatchQueue.main.async { [self] in
            moves = message.moves
            audience = message.audience
        }
    }
    
}
