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
        
        if let name = defaults.string(forKey: "name"){
            return Player(id: identifier, name: name)
        }
        else {
            let name = randomName()
            saveName(name)
            return Player(id: identifier, name: name)
        }
                
    }
    
    public func saveName(_ name: String){
        print("Saved: \(name)")
        defaults.set(name, forKey: "name")
    }
    
    private func randomName() -> String{
        
        // TODO: Add more or generate more random names.
        let names = ["Orange Mellon", "Purple Cow"]
        
        return names.randomElement()!
    }
    
}
