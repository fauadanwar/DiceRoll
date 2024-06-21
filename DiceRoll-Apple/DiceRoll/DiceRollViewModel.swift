//
//  DiceRollViewModel.swift
//  DiceRoll
//
//  Created by Fouad Mohammed Rafique Anwar on 21/06/24.
//

import Foundation
class DiceRollViewModel: ObservableObject {
    @Published var dices: [Int] = [1]
    var numberOfDices: Int = 1 {
        didSet {
            dices = Array(repeating: 1, count: numberOfDices)
        }
    }
    
    func rollDice() {
        for index in 0..<numberOfDices {
            dices[index] = Int.random(in: 1...6)
        }
    }
}
