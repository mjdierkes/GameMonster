//
//  PlayTogether.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/14/21.
//

import Foundation
import GroupActivities


/// Provides information about the activity to the Group Activities framework.
public struct PlayTogether: GroupActivity {
    
    public var metadata: GroupActivityMetadata {
        var metadata = GroupActivityMetadata()
        
        /// Title and comment is displayed to users within a FaceTime group.
        /// This is what entices them to download and play the app.
        metadata.title = NSLocalizedString("GameMonster", comment: "TicTacToe")
        
        metadata.type = .generic
        return metadata
    }
    
}
