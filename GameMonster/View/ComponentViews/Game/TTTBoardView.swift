//
//  TicTacToeView.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/14/21.
//

import SwiftUI

struct TTTBoardView: View {
    
    @EnvironmentObject var viewModel: TicTacToe

    var body: some View {
        GeometryReader { geometry in
            ZStack{
                VStack {
                    LazyVGrid(columns: viewModel.columns, spacing: 7) {
                        ForEach(0..<9) { i in
                            ZStack {
                                SquareView(proxy: geometry, systemImageName:
                                            viewModel.moves[i]?.indicator ?? nil)
                            }
                            .onTapGesture {
                                viewModel.update(for: Move(mover: .local, boardIndex: i))
                            }
                        }
                    }
                }
                .disabled(viewModel.isDisabled)
                .padding()
            
                VStack{
                    ConfettiCannon(counter: $viewModel.wins, num: 60, openingAngle: Angle(degrees: 0),
                                   closingAngle: Angle(degrees: 180), radius: 180)
                    Spacer()
                }
            }
        }
    }
}

struct TicTacToeView_Previews: PreviewProvider {
    static var previews: some View {
        TTTBoardView()
    }
}
