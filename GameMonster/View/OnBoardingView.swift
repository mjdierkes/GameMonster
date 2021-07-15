//
//  OnBoardingView.swift
//  GameMonster
//
//  Created by Mason Dierkes on 7/14/21.
//

// To be presented when a user finishes playing their very first game.


import SwiftUI

struct OnBoardingView: View {
    var body: some View {
        
        VStack{
            Text("Welcome to Game Monster")
                .fontWeight(.heavy).font(.title).padding(.top)

            Text("Easily play games with friends over FaceTime.")
            Button(action: {
            
            }) {
                Text("Continue")
                    .fontWeight(.heavy)
                
            }
        }
        
        
        
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
