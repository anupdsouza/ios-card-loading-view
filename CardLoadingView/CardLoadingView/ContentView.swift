//
//  ContentView.swift
//  CardLoadingView
//
//  Created by Anup D'Souza on 09/10/23.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        ZStack {
            // MARK: Background
            LinearGradient(gradient: Gradient(colors: [
                .green,
                .green.opacity(0.75),
                .green]
            ), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)

            VStack {
                CardLoadingView(cards: Array(repeating: AnyView(cardView), count: 5))
                Text("Loading...")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    @ViewBuilder var cardView: some View {
        Image("card")
            .resizable()
            .frame(width: 90, height: 150)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
