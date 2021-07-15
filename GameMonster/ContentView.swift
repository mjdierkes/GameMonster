//
//  ContentView.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/14/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var home = Home()
    @StateObject private var game = ConnectFour()
    
    var body: some View {
//        OnboardingView()
        HomeView()
            .environmentObject(home)
//        TTTGame()
//        MancalaGameView()
//        ConnectFourView()
//            .environmentObject(game)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
