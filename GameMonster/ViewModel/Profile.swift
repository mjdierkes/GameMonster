//
//  ProfileManager.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/15/21.
//

import Foundation


public struct Profile {
    
    let defaults = UserDefaults.standard

    
    public func getDefault(for identifier: UUID) -> Player {
//        
//        if let name = defaults.string(forKey: "name"){
//            print(name)
//            return Player(id: identifier, name: name)
//        }
//        else {
//            let name = randomName()
//            saveName(name)
//            print(name)
//            return Player(id: identifier, name: name)
//        }
        
        print("Crazy Joe Dude")
        return Player(id: UUID(), name: "Crazy Joe")
        
    }
    
    public func saveName(_ name: String){
        print("Saved: \(name)")
        defaults.set(name, forKey: "name")
    }
    
    private func randomName() -> String{
        
        let names = ["Orange Mellon", "Purple Cow"]
        
        return names.randomElement()!
    }
    
}
