//
//  Spoon.swift
//  Hungry Developers
//
//  Created by Joel Groomer on 11/5/19.
//  Copyright © 2019 Julltron. All rights reserved.
//

import Foundation
import UIKit

enum SpoonState {
    case held
    case notHeld
}

class Spoon {
    let spoonNumber: Int
    let spoonLabel: UILabel
    var state = SpoonState.notHeld
    
    init(spoonNumber: Int, spoonLabel: UILabel) {
        self.spoonNumber = spoonNumber
        self.spoonLabel = spoonLabel
    }
    
    func pickUp(by: Int) -> Bool {
        if state == .notHeld {
            state = .held
            DispatchQueue.main.async {
                self.spoonLabel.text = " \(by) "
            }
            return true
        }
        return false
    }
    
    func putDown() {
        DispatchQueue.main.async {
            self.spoonLabel.text = "🥄"
        }
        state = .notHeld
    }
}
