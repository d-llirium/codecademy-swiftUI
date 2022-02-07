//
//  QuestionView.swift
//  Code History
//
//  Created by user on 28/01/22.
//

import SwiftUI

struct QuestionView: View {
    
    @EnvironmentObject var viewModel: GameViewModel

    let question: Question
   
    var body: some View {
        VStack {
            Text( question.questionText )
                .font( .largeTitle )
                .bold()
                .multilineTextAlignment( .leading )
            Spacer()
            HStack {
                ForEach( 0..<question.possibleAnswers.count ) { answerIndex in
                    Button {
                        print( "Tapped on option with the text: \( question.possibleAnswers[ answerIndex ] )" )
                        viewModel.makeGuess( atIndex: answerIndex )
                    } label: {
                    ChoiceTextView(
                        choiceText: question.possibleAnswers[ answerIndex ]
                    )
                        .background( viewModel.color( forOptionIndex: answerIndex ) ) //  set the background color with the color calculated by the viewModel.
                    }
                    .disabled( viewModel.guessWasMade )
                }
            }
            if viewModel.guessWasMade { // if a guess was made on the view model we add a Button to the bottom of the screen
                Button( action: { viewModel.displayNextScreen() } ) {
                    BottomTextView( str: "Next" )
                    
                }
            }
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView( question: Game().currentQuestion )
            .environmentObject( GameViewModel() )
    }
}
