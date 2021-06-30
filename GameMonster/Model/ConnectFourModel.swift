//
//  ConnectFour.swift
//  GameMonster
//
//  Created by Mason on 6/27/21.
//

import Foundation

public enum ChipColor: Int {
    case none = 0
    case red, yellow
}


public class ConnectFourModel {
    
    public var slots = [ChipColor]()
    
    public init() {
        for _ in 0..<ConnectFour.width * ConnectFour.height {
            slots.append(.none)
        }
    }
    
    
    public func nextEmptySlot(in column: Int) -> Int? {
        for row in 0..<ConnectFour.height {
            if chip(inColumn: column, row: row) == .none {
                return row
            }
        }
        
        return nil
    }
    
    public func add(chip: ChipColor, in column: Int){
        if let row = nextEmptySlot(in: column) {
            set(chip: chip, in: column, row: row)
        }
    }
    
    public func isFull() -> Bool {
        for column in 0 ..< ConnectFour.width {
            if canMove(in: column){
                return false
            }
        }
        
        return true
    }
    
    

    private func chip(inColumn column: Int, row: Int) -> ChipColor {
        return slots[row + column * ConnectFour.height]
    }
    
    private func set(chip: ChipColor, in column: Int, row: Int) {
        slots[row + column * ConnectFour.height] = chip
    }
    
    private func canMove(in column: Int) -> Bool {
        return nextEmptySlot(in: column) != nil
    }
    
    private func squaresMatch(initialChip: ChipColor, row: Int, col: Int, moveX: Int, moveY: Int) -> Bool {
        if row + (moveY * 3) < 0 { return false }
        if row + (moveY * 3) >= ConnectFour.height { return false }
        if col + (moveX * 3) < 0 { return false }
        if col + (moveX * 3) >= ConnectFour.width { return false }
        
        if chip(inColumn: col, row: row) != initialChip { return false }
        if chip(inColumn: col + moveX, row: row + moveY) != initialChip { return false }
        if chip(inColumn: col + (moveX * 2), row: row + (moveY * 2)) != initialChip { return false }
        if chip(inColumn: col + (moveX * 3), row: row + (moveY * 3)) != initialChip { return false }
        
        return true
    }
    
    private func squaresMatchOpenChain(initialChip: ChipColor, row: Int, col: Int, moveX: Int, moveY: Int) -> Bool {
        if row + (moveY * 3) < 0 { return false }
        if row + (moveY * 3) >= ConnectFour.height { return false }
        if col + (moveX * 3) < 0 { return false }
        if col + (moveX * 3) >= ConnectFour.width { return false }

        var countNone = 0

        for i in 0 ..< 4 {
            let currentChip = chip(inColumn: col + (moveX * i), row: row + (moveY * i))
            if currentChip == .none { countNone += 1 }
            if countNone > 1 { return false }
            if currentChip != .none && currentChip != initialChip { return false }
        }

        return true
    }
    
    private func numberOfOpenChains(for chip: ChipColor, chainLength: Int = 4) -> Int {
        var openChains = 0
        
        for row in 0..<ConnectFour.height {
            for col in 0..<ConnectFour.width {
                if squaresMatchOpenChain(initialChip: chip, row: row, col: col, moveX: 1, moveY: 0){
                    openChains += 1
                }
                if squaresMatchOpenChain(initialChip: chip, row: row, col: col, moveX: 0, moveY: 1){
                    openChains += 1
                }
                if squaresMatchOpenChain(initialChip: chip, row: row, col: col, moveX: 1, moveY: 1){
                    openChains += 1
                }
                if squaresMatchOpenChain(initialChip: chip, row: row, col: col, moveX: 1, moveY: -1){
                    openChains += 1
                }
            }
        }
        
        return openChains
    }
    
    
}
