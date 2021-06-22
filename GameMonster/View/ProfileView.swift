//
//  ProfileView.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/15/21.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var game: GameBoardRequestType
    @State private var changed = false
    
    var body: some View {
        VStack{
            Text("Profile")
                .fontWeight(.heavy).font(.title)
            
            Text(game.player.name)
            
            TextField("Enter your name", text: $game.player.name, onEditingChanged: { (changed) in
                if changed {
                    
                    print("changed")
                }
            },
            onCommit: {
                game.updateProfile(name: game.player.name)
                print("commit")
            }
            )
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
