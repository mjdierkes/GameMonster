//
//  HomeView.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/15/21.
//

import SwiftUI
import GroupActivities

struct HomeView: View {
    
    public let columns = [GridItem(.flexible()),
                          GridItem(.flexible()),
                          GridItem(.flexible())]
    
    @EnvironmentObject var home: Home
    @State private var isPresented = false
    @State private var gameNum = -1
    @StateObject var groupStateObserver = GroupStateObserver()

    private let groupSessionManager = GameBoardRequestType(type: .TicTacToe)
    
    var body: some View {
      
        
//        if groupStateObserver.isEligibleForGroupSession {
            ZStack{
                
                if home.show {
                    switch gameNum {
                    case 0:
                        TTTGame()
                    default:
                        ZStack{}
                    }
                }
                
                else {
                    VStack{
                        Text("Games")
                            .fontWeight(.heavy).font(.title).padding(.top)
                        LazyVGrid(columns: columns, spacing: 35) {

                            GameButton(game: Game(name: "Tic Tac Toe", coverImage: nil))
                                
                                .onTapGesture(perform: {
                                    gameNum = 0
                                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.8)){
                                        groupSessionManager.impactGenerator.impactOccurred()
                                        home.show = true
                                    }
                                    
                                })

                        }.padding()
                        Spacer()
//                            .onAppear(perform: {
//                                print(groupSessionManager.session)
//                                print(groupStateObserver.isEligibleForGroupSession)
//                                if groupSessionManager.session == nil && groupStateObserver.isEligibleForGroupSession {
//                                    PlayTogether().activate()
//                                    print("Automatically Enabled Group Session")
//                                }
//                            })
                      
                        
                        
                    }
                        
                }
                
            }
//        }
        
      
        
        
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
