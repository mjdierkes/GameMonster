//
//  SquareView.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/14/21.
//

import SwiftUI

struct SquareView: View {
    
    var proxy: GeometryProxy
    var systemImageName: String?
    
    var body: some View {
        ZStack{
            Rectangle()
                .cornerRadius(9)
                .foregroundColor(.gray).opacity(0.5)
                .frame(width: proxy.size.width/3 - 15, height: proxy.size.width/3 - 15)
            
            if let symbol = systemImageName {
                Image(systemName: symbol)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
            }
        }
        
    }
}
