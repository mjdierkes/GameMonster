//
//  Testing.swift
//  GameMonsterUITests
//
//  Created by Mason Dierkes on 7/1/21.
//

import SwiftUI

struct Testing: View {
    @State private var test = false

       var body: some View {
           Button("Press here") {
               test.toggle()
           }
           .padding()
           .offset(y: test ? 0 : -80)
           .animation(.interpolatingSpring(stiffness: 350, damping: 5, initialVelocity: 10))       }
}

struct Testing_Previews: PreviewProvider {
    static var previews: some View {
        Testing()
    }
}
