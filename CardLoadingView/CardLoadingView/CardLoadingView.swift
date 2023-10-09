//
//  CardLoadingView.swift
//  CardLoadingView
//
//  Created by Anup D'Souza on 09/10/23.
//

import SwiftUI

struct CardLoadingView: View {
    @State var cards: [AnyView]
    @State var animate = false
    
    var body: some View {
        ZStack {
            ForEach(0..<cards.count, id: \.self) { index in
                cards[index]
                    .offset(x: offsetForCardAtIndex(index))
                    .rotationEffect(.degrees(rotationForCardAtIndex(index)), anchor: .bottom)
            }
        }
        .onAppear() {
            startAnimation()
        }
    }
    
    private func offsetForCardAtIndex(_ index: Int) -> CGFloat {
        let offset: CGFloat
        if cards.count.isMultiple(of: 2) {
            offset = (CGFloat(index) - (CGFloat(cards.count) / 2.0) + 0.5) * 10
        } else {
            offset = CGFloat(index - cards.count / 2) * 10
        }
        return animate ? offset : 0
    }

    private func rotationForCardAtIndex(_ index: Int) -> CGFloat {
        offsetForCardAtIndex(index)
    }
    
    func startAnimation() {
        withAnimation(Animation.linear(duration: 0.75).delay(0.25).repeatForever(autoreverses: true)) {
            animate.toggle()
        }
    }
}

struct CardContainerView_Previews: PreviewProvider {
    static var previews: some View {
        let card = RoundedRectangle(cornerRadius: 15)
            .strokeBorder(.black, lineWidth: 2)
            .background(
                RoundedRectangle(cornerRadius: 15).fill(.white)
            )
            .frame(width: 100, height: 180)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(.black, lineWidth: 2)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.clear))
                    .padding(10)
            )
            .overlay(
                Image(systemName: "suit.spade.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.black)
                    .padding(15)
            )
        
        let cards = Array(repeating: AnyView(card), count: 5)
        CardLoadingView(cards: cards)
    }
}
