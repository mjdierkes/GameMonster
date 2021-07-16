//
//  FeatureSection.swift
//  GameMonster
//
//  Created by Mason Dierkes on 7/16/21.
//

import SwiftUI

struct FeatureSection: View {
    
    public let title: String
    public let description: String
    public let systemImage: String
    
    var body: some View {
        HStack {
            Image(systemName: systemImage)
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(Color.green)
                .padding(.trailing)
            
            VStack(alignment: .leading){
                Text(title)
                    .bold()
                Text(description)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(20)
        .frame(width: 350)
    }
    
}

struct FeatureSection_Previews: PreviewProvider {
    static var previews: some View {
        FeatureSection(title: "Add almost anything", description: "Capture documents, photos maps, and more for a richer notes experience.", systemImage: "video.circle.fill")
    }
}
