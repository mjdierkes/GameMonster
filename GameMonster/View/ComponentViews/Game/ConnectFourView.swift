//
//  ConnectFourView.swift
//  GameMonster
//
//  Created by Mason on 6/27/21.
//

import SwiftUI

struct ConnectFourView: View {
    
    @EnvironmentObject var game: ConnectFour

    
    var body: some View {
        
        VStack{
            GeometryReader { geometry in
                ZStack{
                    VStack {
                        LazyVGrid(columns: game.columns, spacing: 45) {
                            ForEach(0..<ConnectFour.height) { r in
                                ForEach(0..<ConnectFour.width) { i in
                                    Circle()
                                        .size(width: geometry.size.width/8.5, height: geometry.size.width/8.5)
                                        .foregroundColor( game.slots[r*i] == .red ? Color.red : Color("BoardDarkBlue") )

                                    .onTapGesture {
                                        game.update(for: ConnectMove(mover: .local, boardIndex: r*i, column: i))
                                    }
                                }
                            }
                        }
                        Spacer()
                    }
                    .disabled(game.isDisabled)
                    .padding()
                
                    VStack{
                        ConfettiCannon(counter: $game.wins, num: 60, openingAngle: Angle(degrees: 0),
                                       closingAngle: Angle(degrees: 180), radius: 180)
                        Spacer()
                    }
                }
            }
            .frame(width: 375, height: 350)
            .background(Color("BoardBlue"))
            .cornerRadius(10)
            .padding()

        }
        
        
    }
}

struct ConnectFourView_Previews: PreviewProvider {
    @StateObject private static var game = ConnectFour()

    static var previews: some View {
        ConnectFourView()
            .environmentObject(game)
    }
}
