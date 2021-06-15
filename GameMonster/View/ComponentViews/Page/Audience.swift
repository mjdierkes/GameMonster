//
//  Audience.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/14/21.
//

import SwiftUI

struct Audience: View {
    
    @EnvironmentObject var game: TicTacToe
    
    var body: some View {
        
        if(game.audience.count > 0){
            VStack{
                HStack{
                    Text("Audience")
                        .fontWeight(.heavy).font(.title2)
                    Spacer()
                }
                HStack{
                    ForEach(game.audience) { player in
                        PlayerTag(player: player)
                    }
                }
            }
            .padding()
        }

    }
}

struct Audience_Previews: PreviewProvider {
    static var previews: some View {
        Audience()
    }
}
