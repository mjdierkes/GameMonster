//
//  Home.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/15/21.
//

import Foundation
import SwiftUI


public class Home: ObservableObject{
    
    @Published var show = false
    @Published var activeGame = ""
    
    let defaults = UserDefaults.standard

    public var isOldUser: Bool {
        get {
            return defaults.bool(forKey: "isOldUser")
        }
        set (status) {
            let defaults = UserDefaults.standard
            print("Saved: New User Status as \(status)")
            defaults.set(status, forKey: "isOldUser")
        }
    }
    
}
