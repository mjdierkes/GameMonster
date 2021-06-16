//
//  PlayTogether.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/14/21.
//

import Foundation
import GroupActivities

public struct PlayTogether: GroupActivity {
    
    public var metadata: GroupActivityMetadata {
        var metadata = GroupActivityMetadata()
        metadata.title = NSLocalizedString("GameMonster", comment: "TicTacToe")
        
        metadata.type = .generic
        return metadata
    }
    
}
