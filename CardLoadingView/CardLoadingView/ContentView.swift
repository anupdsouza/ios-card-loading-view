//
//  ContentView.swift
//  CardLoadingView
//
//  Created by Anup D'Souza on 09/10/23.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack {
            CardLoadingView(cards: Array(repeating: AnyView(cardView), count: 5))
            Text("Loading...")
                .padding(.top, 20)
        }
        .padding()
    }
    
    @ViewBuilder var cardView: some View {
        RoundedRectangle(cornerRadius: 15)
            .strokeBorder(.black, lineWidth: 2)
            .background(
                RoundedRectangle(cornerRadius: 15).fill(.white)
            )
            .frame(width: 90, height: 150)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(.black, lineWidth: 2)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.clear))
                    .padding(10)
            )
            .overlay(
                Image(systemName: "suit.spade.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.black)
                    .padding(15)
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
