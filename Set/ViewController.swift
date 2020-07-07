//
//  ViewController.swift
//  SetGame
//
//  Created by Pablo Tamayo on 05/07/2020.
//  Copyright © 2020 Pablo Tamayo. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet private weak var scoreLabel: UILabel!
    
    @IBAction func touchStartGameButton(_ sender: UIButton) {
        game.createCardDeck()
        getCards()
//        cupdateBoard()
    }
    @IBAction private func touchDealCardsButton(_ sender: UIButton) {
//        checkForMatch()
        getCards()
//        cupdateBoard()
    }

    // MARK: Properties
    
    var game = SetGame()
    var cardsOnTable = [Card]()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func getCards() {
        cardsOnTable = game.dealCards(numberOfcards: 12)
        print(cardsOnTable)
        
        // Get styling for selected cards
        for index in cardsOnTable.indices {
            cardsOnTable[index].marker = makeCardMarker(for: cardsOnTable[index])
            print(cardsOnTable[index].marker?.string)
        }
        
        // Assign to buttons
        for index in cardsOnTable.indices {
            cardButtons[index].setAttributedTitle(cardsOnTable[index].marker, for: .normal)
        }
        
        
    }
}

// MARK: Game logic

// MARK: UI

extension ViewController {
    func updateLabels() {
        
    }
    
    func updateCards() {
        
    }
    
    func dealCards() {
        
    }
}

// MARK: Decorate cards

extension ViewController {
    
    // MARK: Styling
    
    private func getStyling(for card: Card) -> (color: UIColor, char: Character, fill: CGFloat) {
        var color: UIColor
        var char: Character
        var fill: CGFloat
        
        switch card.color {
        case .color1:
            color = UIColor(named: "red")!
        case .color2:
            color = UIColor(named: "green")!
        case .color3:
            color = UIColor(named: "blue")!
        }
        
        switch card.shape {
        case .shape1:
            char = Character("▲")
        case .shape2:
            char = Character("●")
        case .shape3:
            char = Character("■")
        }
        
        switch card.fill {
        case .fill1:
            fill = 1.0
        case .fill2:
            fill = 0.25
        case .fill3:
            fill = 0.0
        }
        
        return (color: color, char: char, fill: fill)
    }
    
    private func makeCardMarker(for card: Card) -> NSAttributedString {
        let style = getStyling(for: card)
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor : style.color.withAlphaComponent(style.fill),
            NSAttributedString.Key.strokeColor : style.color,
            NSAttributedString.Key.strokeWidth : -10.0
        ]
        let attrString = NSAttributedString(string: String(style.char), attributes: attributes)
        return attrString
    }
        
}
