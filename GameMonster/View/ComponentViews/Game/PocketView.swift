//
//  PocketView.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/21/21.
//

import SwiftUI

struct PocketView: View {
    
    private var move: MancalaMove
    
    public init(for move: MancalaMove){
        self.move = move
    }
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack{
                Circle()
                    .foregroundColor(Color.gray)
                Text("\(move.stones)")
                    .foregroundColor(Color.white)
//                    ForEach(0..<move.stones) { stone in
////                        Circle()
////                            .frame(width: 10, height: 10)
////                            .position(x: geometry.size.width * 0.4, y: geometry.size.height * 0.7)
//                    }
                }
                
            }
            .frame(width: 40, height: 40)

        }
}

struct PocketView_Previews: PreviewProvider {
    
    @State private static var move = MancalaMove(mover: .local, boardIndex: 2, stones: 4)
    
    static var previews: some View {
        PocketView(for: move)
    }
}
