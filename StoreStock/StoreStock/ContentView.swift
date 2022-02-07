//
//  ContentView.swift
//  StoreStock
//
//  Created by user on 04/01/22.
//

import SwiftUI

struct ContentView: View {
    private var items = ["Sabonete", "Alface", "Papel Higiênico", "Coca Cola"] {
        didSet{
          items = items.sorted(by: >)
        }
    }
    var body: some View {
        // Navigation view acts a container for navigable views and content
        NavigationView {
            VStack {
                Text( "Items in Stock" )
                    .font(.title)
                    .padding()
                
                Spacer()
                
                // Adding the NavigationLink moves the user to the item screen
                ForEach( 0 ..< items.count )
                { itemIndex in
                    // Define the view that will be returned for each index
                    NavigationLink(
                        destination: ItemDetailView( itemName: items[ itemIndex ] ),
                        label: {
                                   Text( items[ itemIndex ] )
                                 })
                    Spacer()
                }
                Spacer()
            }
            // Sets a navigation title of "Mercearia"
            .navigationTitle(
                Text( "Mercearia" ) )
            // Sets the styling of the navigation title to inline
            .navigationBarTitleDisplayMode( .inline )
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
