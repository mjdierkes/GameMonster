//
//  HomeView.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/15/21.
//

import SwiftUI

struct HomeView: View {
    
    public let columns = [GridItem(.flexible()),
                          GridItem(.flexible()),
                          GridItem(.flexible())]
    
    @EnvironmentObject var home: Home
    @State private var isPresented = false

    var body: some View {
      
        
        VStack{
            Text("Games")
                .fontWeight(.heavy).font(.title)
            LazyVGrid(columns: columns, spacing: 35) {
                ForEach(home.games) { game in
                    VStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 19)
                                .foregroundColor(Color("Offwhite"))
                                .frame(width: 100, height: 100)
                            
                            if game.wins > 0 {
                                HStack{
                                    Text("\(game.wins)")
                                        .bold()
                                        .font(.system(size: 12))
                                        .offset(x: 5)
                                    Image(systemName: "crown.fill")
                                        .resizable()
                                        .foregroundColor(Color.yellow)
                                        .frame(width: 15, height: 12)
                                }
                                .offset(x: 22, y: -32)
                            }
                            
                        }
                       
                        Text(game.name)
                            .font(.subheadline)
                            .bold()
                    }
                    .onTapGesture {
                        isPresented = true
                        
                    }.fullScreenCover(isPresented: $isPresented) { TTTGame() }
                }
               
            }.padding()
            Spacer()
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
