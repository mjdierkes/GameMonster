//
//  Welcome.swift
//  GameMonster
//
//  Created by Mason Dierkes on 7/16/21.
//

import SwiftUI

struct Welcome: View {
    
    @Binding var pageID: Int
    
    var body: some View {
        VStack {
            Text("Welcome to\nGame Monster")
                .fontWeight(.heavy).font(.largeTitle).multilineTextAlignment(.center)
                .padding(.top, 70)


            FeatureSection(title: "Add almost anything", description: "Capture documents, photos maps, and more for a richer notes experience.", systemImage: "video.circle.fill")

            FeatureSection(title: "Note to self, or with anyone", description: "Invite others to view or make changes to a note.", systemImage: "person.crop.circle.fill")

            FeatureSection(title: "Sketch your thoughts", description: "Draw using just your finger.", systemImage: "hand.draw.fill")

            Spacer()

            Button {
                withAnimation {
                    pageID = 1
                }
            } label: {
                Text("Continue")
                    .bold()
                    .frame(maxWidth: 300)
                    .padding(10)
                    .foregroundColor(.white)
            }.background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .padding(.bottom, 50)

        }
        .transition(.slide)
    }
}

struct Welcome_Previews: PreviewProvider {
    @State private static var pageID = 0
    static var previews: some View {
        Welcome(pageID: $pageID )
    }
}
