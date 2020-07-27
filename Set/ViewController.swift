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
        startGame()
    }
    @IBAction private func touchDealCardsButton(_ sender: UIButton) {
//        checkForMatch()
        getCards(numberOfCards: 3)
//        updateBoard()
    }

    // MARK: Properties
    
    var game = SetGame()
    var cardsOnTable = [Card]()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame()
    }

    func startGame() {
        resetBoard()
        game.createCardDeck()
        getCards(numberOfCards: 12)
    }
    
    private func resetBoard() {
        cardsOnTable = []
        for button in cardButtons {
            button.isEnabled = false
            button.backgroundColor = UIColor.red
            button.setAttributedTitle(nil, for: .normal)
        }
    }
    
    private func getCards(numberOfCards: Int) {
        let moreCards = game.dealCards(numberOfcards: numberOfCards)
        if moreCards.count > 1 {
            cardsOnTable += moreCards
            // Assign to buttons
            assignCards(for: moreCards)
        } else {
            print("No more cards in the stack!")
        }
    }
    
    private func assignCards(for newCards: [Card]) {
        var newCards = newCards
        for button in cardButtons {
            if button.isEnabled == false, newCards.count > 0 {
                button.isEnabled = true
                let newCard = newCards.remove(at: 0)
                button.setAttributedTitle(newCard.marker, for: .normal)
                button.backgroundColor = UIColor.green
            }
        }
    }
}

// MARK: Game logic

private extension ViewController {
    // on touch 3 more cards
    // button selection logic
}

// MARK: Scoring logic

//private extension ViewController {
//
//}

// MARK: UI

private extension ViewController {
    func updateLabels() {
        
    }
    
    func updateCards() {
        
    }
    

}

