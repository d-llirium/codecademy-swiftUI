//
//  Game.swift
//  Code History
//
//  Created by user on 28/12/21.
//

import Foundation

struct Game { // Application Programming Interface, or API describes how two programs (or two components inside of a program) can interact with each other.
    // MARK: - ATRIBUTES
    // MARK: - private set
    private( set ) var guesses = [ Question: Int ]() // hashable structure as a key in a dictionary
    private( set ) var currentQuestionIndex = 0
    private( set ) var isOver = false
    
    // MARK: - private
    private let questions = Question.allQuestions.shuffled()
    
    // MARK: - only get = computed attributes  return a value that is derived from other properties
    var numberOfQuestions: Int { //  returns the number of questions
        questions.count
    }
    
    var currentQuestion: Question { // returns the current asked question
        questions[ currentQuestionIndex ]
    }
    
    var guessCount: ( correct: Int, incorrect: Int ) { // returns a tuple containing the total number of correct guesses and the number of incorrect guesses >> iterates through the guesses dictionary and calculates the total number of guesses.
        var count: ( correct: Int, incorrect: Int ) = ( 0, 0 )
        for ( question, guessedIndex ) in guesses {
            if question.correctAnswerIndex == guessedIndex {
                count.correct += 1
            } else {
                count.incorrect += 1
            }
        }
        return count // returns a tuple
    }
    
    // MARK: - METHODS
    // MARK: - internal
    mutating func makeGuessForCurrentQuestion( atIndex index: Int ) { // will update the guessed index for a specific question
        guesses[ currentQuestion ] = index
    }
    mutating func updateGameStatus() { // will increment currentQuestionIndex by 1 in order to proceed to the next question. If there are no more questions left, it will set isOver to true which will end the game
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            isOver = true
        }
    }
}
