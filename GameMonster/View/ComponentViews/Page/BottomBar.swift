//
//  BottomBar.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/14/21.
//

import SwiftUI
import GroupActivities

struct BottomBar: View {
    
    @EnvironmentObject var game: TicTacToe
    @StateObject var groupStateObserver = GroupStateObserver()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        HStack{
            Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
                ZStack{
                    Circle()
                        .foregroundColor(Color("Offwhite"))
                        .frame(width: 35, height: 35)
                    Image(systemName: "xmark")
                }
            }
            Spacer()
            if game.session == nil && groupStateObserver.isEligibleForGroupSession {
                Button(action: {PlayTogether().activate()
                    print("Sending Activation Request")}) {
                    Text("Group Activity")
                }
            }
            Button(action: {game.reset()}) {
                Text("New Game")
                    .fontWeight(.heavy)
                
            }
            .cornerRadius(30)
            .tint(.accentColor)
            .controlProminence(.increased)
            .buttonStyle(.bordered)
            .controlSize(.regular)
            
           
        }
        .padding()
    }
}

struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomBar()
    }
}
