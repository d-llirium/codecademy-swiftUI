//
//  ScoreViewModel.swift
//  Code History
//
//  Created by user on 03/02/22.
//

import Foundation

struct ScoreViewlModel {
    let correctGuesses: Int
    let incorrectGuesses: Int
    var percentage: Int {
        ( correctGuesses * 100 / ( correctGuesses + incorrectGuesses))
    }
}
