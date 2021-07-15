//
//  Header.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/14/21.
//

import SwiftUI

struct Header: View {
    
    @EnvironmentObject var game: GameBoardRequestType
    @EnvironmentObject var home: Home
    @State private var presentModal = false
    
    var body: some View {
        
        VStack{
            HStack{
                
                Button(action: {
                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.8)){
                        home.show = false
                        home.activeGame = game.name
                    }
                }) {
                    ZStack{
                        Circle()
                            .foregroundColor(Color("Offwhite"))
                            .frame(width: 35, height: 35)
                        Image(systemName: "xmark")
                    }
                }
                
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
