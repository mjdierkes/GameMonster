//
//  PlayerTag.swift
//  DrawTogether
//
//  Created by Mason Dierkes on 6/13/21.
//

import SwiftUI

struct PlayerTag: View {
    
    var player: Player
    
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(Color("Offwhite"))
                .frame(width: 150, height: 50)

            HStack{
                Image(systemName: "person.fill")
                    .padding()
                    .frame(width: 50, height: 35)
                    .background(Color.white)
                    .cornerRadius(17)
                
                Text(player.name)
                    .bold()
                    .padding(.trailing)
                    .font(.system(size: 500))
                    .minimumScaleFactor(0.01)
                    .frame(width: 75, height: 40)

            }

        }.scaleEffect(0.8)

    }
}

struct PlayerTag_Previews: PreviewProvider {
    @State private static var player = Player(id: UUID(), name: "Orange Mellon")
    static var previews: some View {
        PlayerTag(player: player)
    }
}
