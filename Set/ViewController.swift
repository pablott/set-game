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
    }

    // MARK: Properties
    
    var game = SetGame()
    var cardsOnTable = [Card]()
    
    var selectedCards: [UIButton] {
        get {
            cardButtons.filter {$0.isSelected}
        }
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        startGame()
    }
    
    func setupUI() {
        for button in cardButtons {
            button.layer.borderWidth = 2.0
            button.layer.borderColor = UIColor.gray.cgColor
            button.layer.cornerRadius = 8.0
            button.addTarget(self, action: #selector(self.selectCard), for: .touchUpInside)
        
        }
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
        let availableButtons = cardButtons.filter {!$0.isEnabled}
        let numberOfPossibleCards = min(availableButtons.count, numberOfCards)
        
        if numberOfPossibleCards > 0 {
            let moreCards = game.dealCards(numberOfcards: numberOfPossibleCards)
            print("requested: \(numberOfCards), available places \(availableButtons.count), dealt: \(moreCards.count), remaining in stack \(game.cards.count)")
            
            if moreCards.count > 1 {
                cardsOnTable += moreCards
                // Assign to buttons
                assignCards(cards: moreCards)
            } else {
                print("No more cards in the stack!")
            }
        } else {
            print("No more space on board!")
        }
    }
    
    private func assignCards(cards newCards: [Card]) {
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

    @objc func selectCard(_ button: UIButton) {
        if !button.isSelected {
            button.layer.borderColor = UIColor.blue.cgColor
            button.isSelected = true
        } else {
            button.layer.borderColor = UIColor.gray.cgColor
            button.isSelected = false
        }
        print(selectedCards)
    }
}

