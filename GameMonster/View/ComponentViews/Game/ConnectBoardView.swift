//
//  ConnectBoardView.swift
//  GameMonster
//
//  Created by Mason on 6/27/21.
//

import SwiftUI

struct ConnectBoardView: View {
    
    @EnvironmentObject var game: ConnectFour

    
    var body: some View {
        
            ZStack {
                
                GeometryReader { geometry in
                    VStack(alignment: .center) {
                        Spacer()
                                                
                        HStack(spacing: 0) {
                            
                            ForEach(Array(game.board.enumerated()), id: \.offset) { (xOffset, column) in

                                VStack(spacing: 0) {
                                    ForEach(Array(column.enumerated()), id: \.offset) { (yOffset, cell) in
                                        CellView(cell: cell, proxy: geometry)
                                    }
                                }
                            
                                .onTapGesture {
                                    withAnimation(.easeIn) {
                                        self.game.update(at: xOffset)
                                    }
                                }
                            }
                            

                        }
                        .padding(12)
                        .background(Color("BoardBlue"))
                        .cornerRadius(10)
                        .frame(width: 350, height: 200)
                        
                        Spacer()

                    }
                }
                
                .disabled(game.isDisabled)
                
            
                VStack{
                    ConfettiCannon(counter: $game.wins, num: 60, openingAngle: Angle(degrees: 0),
                                   closingAngle: Angle(degrees: 180), radius: 180)
                    Spacer()
                }
            }

        }
    }


struct ConnectFourView_Previews: PreviewProvider {
    @StateObject private static var game = ConnectFour()

    static var previews: some View {
        ConnectBoardView()
            .environmentObject(game)
    }
}
