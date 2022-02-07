//
//  GameViewModel.swift
//  Code History
//
//  Created by user on 28/01/22.
//

import SwiftUI

// 1: new object type named GameViewModel that conforms to the ObservableObject protocol.
class GameViewModel: ObservableObject {
    
    // MARK: - Published properties
    //2
    // MARK: - game
    // The view model will emit events when changes are made to its Published properties, namely game of Type Game()
    // MARK: - @Published
    // wrapped in the @Published modifier so our GameViewModel can notify any observers when changes are made to it like when a user makes a guess
    @Published private var game = Game()
    
    // MARK: - Internal properties
    // 3
    var currentQuestion: Question { // returns the game’s current question
        game.currentQuestion
    }
    // 4
    var questionProgressText: String { // returns the String to be displayed at the top of the screen to indicate the user’s progress.
        
        "\( game.currentQuestionIndex + 1 ) / \( game.numberOfQuestions )"
    }
    // 1
    var guessWasMade: Bool { //  checks game.guesses for a value
        if let _ = game.guesses[ currentQuestion ] {
            return true //  If a value is found we know the user has made a guess at the question
        } else {
            return false
        }
    }
    var gameIsOver: Bool { // returns the isOver value from game
        game.isOver
    }
    var correctGuesses: Int {
        game.guessCount.correct
    }
   
    var incorrectGuesses: Int {
        game.guessCount.incorrect
    }
    // MARK: - Internal Methods
    // 2
    func makeGuess( atIndex index: Int ) { // communicates the guessed index to the game game property for the currently displayed question.
        game.makeGuessForCurrentQuestion( atIndex: index )
    }
    // 3
    func displayNextScreen() { // will update the game’s status and will be called when the user taps on the button to proceed to the next screen.
        game.updateGameStatus()
    }
    func color( forOptionIndex optionIndex: Int ) -> Color { // takes an index as its parameter and returns a Color
        if let guessedIndex = game.guesses[ currentQuestion ] { // use conditional binding to check if the user has made a guess.
            if guessedIndex != optionIndex {
                return GameColor.main
            } else if guessedIndex == currentQuestion.correctAnswerIndex {
                return GameColor.correctGuess
            } else {
                return GameColor.incorrectGuess
            }
        } else {
            return GameColor.main
        }
    }
}
