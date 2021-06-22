//
//  PocketView.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/21/21.
//

import SwiftUI

struct StoreView: View {
    
    public var stones: Int
    
    var body: some View {
            
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(Color.gray)
                .frame(width: 100, height: 35)
            
            Text("\(stones)")
                .foregroundColor(Color.white)
        }
        
    }

}

struct StoreView_Previews: PreviewProvider {
    
    @State private static var move = MancalaMove(mover: .local, boardIndex: 2, stones: 4)
    
    static var previews: some View {
        PocketView(for: move)
    }
}
