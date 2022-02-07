//
//  ContentView.swift
//  Code History
//
//  Created by user on 28/09/21.
//

import SwiftUI

struct GameView: View {
    @StateObject var viewModel = GameViewModel()
    
    var body: some View {
        ZStack { //aligning views in both axes
            GameColor.main.ignoresSafeArea()
            VStack
            { // view that arranges its children in a vertical line.
                Text( viewModel.questionProgressText )
                    .font( .callout )
                    .multilineTextAlignment( .leading )
                    .padding()
                QuestionView( question: viewModel.currentQuestion )
            }
        }
        .foregroundColor( .white) // makes the color of the foreground elements displayed by this view.
        .navigationBarHidden( true ) //  hide the Back button from the user by hiding the navigation bar
        .environmentObject( viewModel ) // any subviews to QuestionView will have access to the view model with the EnvironmentObject property wrapper.
        .background(
            NavigationLink( // will transition to the final screen automatically once the game is over
                destination: ScoreView(
                    viewModel: ScoreViewlModel(
                        correctGuesses: viewModel.correctGuesses,
                        incorrectGuesses: viewModel.incorrectGuesses
                    )
                ), // where the application will navigate
                isActive: .constant( viewModel.gameIsOver ), // configures the NavigationLink to monitor the new gameIsOver property you added to the GameViewModel. When the game is over, this constant becomes true and the ScoreView will be presented
                label: {
                    EmptyView() // the NavigationLink observes invisibly from the background.
                }
            )
        )
    }
}

//A type that produces view previews in Xcode.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
