//
//  SetGame.swift
//  SetGame
//
//  Created by Pablo Tamayo on 06/07/2020.
//  Copyright © 2020 Pablo Tamayo. All rights reserved.
//

import  UIKit

struct SetGame {
    
    // MARK: Private
    
    private(set) var cards = [Card]()
    private(set) var matchedCards = [[Card]]()
    var score = 0
    var numberOfMatches: Int? {
        get {
            return matchedCards.count
        }
    }
    
    // MARK: Init
    
    init() {
        createCardDeck()
    }
    
    // MARK: Methods
    
    mutating func createCardDeck() {
        // Creates a deck with every possible combination
        cards = []
        for color in Card.Color.allCases {
            for shape in Card.Shape.allCases {
                for fill in Card.Fill.allCases {
                    let card = Card(color: color, shape: shape, fill: fill)
                    cards.append(card)
                }
            }
        }
    }
    
    mutating func dealCards(numberOfcards: Int = 3) -> [Card] {
        var cardsDealt: [Card] = []
        for _ in 1...numberOfcards {
            if let randomCard = getRandomCard() {
                cardsDealt.append(randomCard)
            }
        }
        print("remaining cards in deck: \(cards.count)")
        return cardsDealt
    }
    
    mutating private func getRandomCard() -> Card? {
        if cards.count > 0 {
            let randomIndex = cards.index(cards.startIndex, offsetBy: cards.count.arc4random)
            print("randomIndex: \(randomIndex)")
            return cards.remove(at: randomIndex)
        }
        return nil
    }
}

// MARK: Extension

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
