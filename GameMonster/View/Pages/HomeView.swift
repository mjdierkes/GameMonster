//
//  HomeView.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/15/21.
//

import SwiftUI
import GroupActivities

struct HomeView: View {

    @EnvironmentObject var home: Home
    @StateObject var groupStateObserver = GroupStateObserver()
    
    @State private var isPresented = false
    @State private var gameNum = 0
    @State private var presentModal = false
    
    public let columns = [GridItem](repeating: GridItem(.flexible()), count: 3 )
    private let groupSessionManager = GameBoardRequestType()
    
    var body: some View {

        ZStack {
//            if home.show {
                switch gameNum {
                case 0:
                    GameView(gameType: .TicTacToe)
                case 1:
                    GameView(gameType: .ConnectFour)
                case 2:
                    GameView(gameType: .Mancala)
                default:
                    ZStack{}
                }
//            }
            
//            else {
//                VStack {
//                    Text("Games")
//                        .fontWeight(.heavy).font(.title).padding(.top)
//                    LazyVGrid(columns: columns, spacing: 35) {
//
//                        ForEach((0..<3), id: \.self) { index in
//
//                            GameButton(game: Game(name: "Tic Tac Toe", coverImage: nil))
//                                .onTapGesture(perform: {
//                                    gameNum = index
//                                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.8)){
//                                        groupSessionManager.impactGenerator.impactOccurred()
//                                        home.show = true
//                                    }
//                                })
//                        }
//                    }
//                    .padding()
//
//                    Spacer()
//                        .sheet(isPresented: $presentModal) {
//                            OnboardingView(showModal: $presentModal)
//                        }
//                    if groupSessionManager.session == nil && groupStateObserver.isEligibleForGroupSession {
//                        Button {
//                            PlayTogether().activate()
//                        } label: {
//                            HStack{
//                                Image(systemName: "person.2.fill")
//                                Text("Activate Group Session")
//                            }
//                        }
//                    }
//
//                }
//                .onAppear {
//                    if !home.isOldUser {
//                        presentModal = true
//                        home.isOldUser = true
//                    }
//                }
//
//            }

            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
