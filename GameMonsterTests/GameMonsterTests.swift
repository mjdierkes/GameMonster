//
//  GameMonsterTests.swift
//  GameMonsterTests
//
//  Created by Mason Dierkes on 6/14/21.
//

import XCTest
@testable import GameMonster

class GameMonsterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        let mancala = Mancala()
        let move = MancalaMove(mover: .local, boardIndex: 1, stones: 4)
        
        mancala.update(for: move)
        mancala.update(for: MancalaMove(mover: .local, boardIndex: 4, stones: 2))
        
        let localMoves = mancala.localMoves
        let opponentMoves = mancala.opponentMoves
        
        for i in 0..<localMoves.count {
            print("\(localMoves[i].stones)   \(opponentMoves[i].stones)")
        }
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

