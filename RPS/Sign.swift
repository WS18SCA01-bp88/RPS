//
//  Sign.swift
//  RPS
//
//  Created by Balmes Pavlov on 11/19/18.
//  Copyright © 2018 Balmes Pavlov. All rights reserved.
//

import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    return sign == 0 ? .rock : sign == 1 ? .paper : .scissors
}

enum Sign: Int {
    case rock = 1, paper, scissors
    
    var emoji: String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "✋"
        case .scissors:
            return "✌️"
        }
    }
    
    func compareSignTo(_ opponent: Sign) -> GameState {
        // let opponent: Sign = randomSign()
        
        switch self {
        case .rock:
            return opponent == .rock ? .draw : opponent == .paper ? .lose : .win
        case .paper:
            return opponent == .paper ? .draw : opponent == .scissors ? .lose : .win
        case .scissors:
            return opponent == .scissors ? .draw : opponent == .rock ? .lose : .win
        }
    }
}
