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
    
    var marker: NSAttributedString?
}
