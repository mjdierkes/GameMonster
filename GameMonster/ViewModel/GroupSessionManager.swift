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

class GroupSessionManager {
    
    private var tasks = Set<Task.Handle<Void, Never>>()
    private var subscriptions = Set<AnyCancellable>()
    
    private var groupSession: GroupSession<PlayTogether>?
    private var messenger: GroupSessionMessenger?
   
    
    // Send messages
    public func sendMessage(as move: Move){
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
    
    private func configureGroupSession(_ groupSession: GroupSession<PlayTogether>){
//        game.reset()
        
        let messenger = GroupSessionMessenger(session: groupSession)
        self.messenger = messenger
        self.groupSession = groupSession
        
        // Update late joiners
        groupSession.$activeParticipants
            .sink{ activeParticipants in
                
               
                
            }
            .store(in: &subscriptions)
        
        // Await to receive Messages
        let moveTask = detach { [weak self] in
            for await (message, _) in messenger.messages(of:
                MoveMessage.self) {
                self?.handle(message)
            }
        }
        tasks.insert(moveTask)
        
        groupSession.join()
    }
    
    // Process the input messages and handle accordingly
    private func handle(_ message: MoveMessage){
        DispatchQueue.main.async {
//            game.update(for: message.move)
        }
    }
    
}
