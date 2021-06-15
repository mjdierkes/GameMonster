//
//  Header.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/14/21.
//

import SwiftUI

struct Header: View {
    
    @EnvironmentObject var game: TicTacToe
    @State private var presentModal = false
    
    var body: some View {
        
        VStack{
            HStack{
                Spacer()
                
                Button(action: {presentModal = true}) {
                    ZStack{
                        Circle()
                            .foregroundColor(Color("Offwhite"))
                            .frame(width: 35, height: 35)
                        Image(systemName: "person.fill")
                    }
                }
                    .sheet(isPresented: $presentModal) { ProfileView() }

            }.padding(.horizontal)
            Text(game.name)
                .fontWeight(.heavy).font(.title)
            HStack{
                PlayerTag(player: game.player)
                Text("VS")
                    .fontWeight(.heavy).font(.headline)
                PlayerTag(player: game.opponent)
            }
        }
       
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
