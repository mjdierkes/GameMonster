//
//  ContentView.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/14/21.
//

import SwiftUI

struct ContentView: View {
    
    /// The main page of the App
    /// The Home model manages the user's data.
    @StateObject private var home = Home()
    
    var body: some View {
        HomeView()
            .environmentObject(home)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
