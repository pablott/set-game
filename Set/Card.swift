//
//  Card.swift
//  SetGame
//
//  Created by Pablo Tamayo on 06/07/2020.
//  Copyright © 2020 Pablo Tamayo. All rights reserved.
//

import UIKit

struct Card {
    
    // MARK: Enums
    
    enum Color: CaseIterable {
        case color1
        case color2
        case color3
    }
    
    enum Shape: CaseIterable {
        case shape1
        case shape2
        case shape3
    }
    
    enum Fill: CaseIterable {
        case fill1
        case fill2
        case fill3
    }
    
    // MARK: Properties
    
    var color: Color
    var shape: Shape
    var fill: Fill
    
    var marker: NSAttributedString? {
        get {
            makeCardMarker(for: self)
        }
    }
}

// MARK: Decorate cards

private extension Card {
    
    // MARK: Styling
    
    func getStyling(for card: Card) -> (color: UIColor, char: Character, fill: CGFloat) {
        var color: UIColor
        var char: Character
        var fill: CGFloat
        
        switch self.color {
        case .color1:
            color = UIColor(named: "red")!
        case .color2:
            color = UIColor(named: "green")!
        case .color3:
            color = UIColor(named: "blue")!
        }
        
        switch self.shape {
        case .shape1:
            char = Character("▲")
        case .shape2:
            char = Character("●")
        case .shape3:
            char = Character("■")
        }
        
        switch self.fill {
        case .fill1:
            fill = 1.0
        case .fill2:
            fill = 0.25
        case .fill3:
            fill = 0.0
        }
        
        return (color: color, char: char, fill: fill)
    }
    
    func makeCardMarker(for card: Card) -> NSAttributedString {
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

extension Card: Equatable {
    
}
