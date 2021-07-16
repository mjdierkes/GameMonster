//
//  OnboardingView.swift
//  GameMonster
//
//  Created by Mason Dierkes on 7/14/21.
//


import SwiftUI

/// This is presented when a user finishes playing their very first game.

struct OnboardingView: View {
    
    @Binding var showModal: Bool
    @State private var pageID = 0
    
    var body: some View {
       
        ZStack {
            if pageID == 0 {
                Welcome(pageID: $pageID)
            }
            else if pageID == 1 {
                FaceTime(showModal: $showModal)
            }
        }
        
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    @State static private var showModal = false
    static var previews: some View {
        OnboardingView(showModal: $showModal)
    }
}
