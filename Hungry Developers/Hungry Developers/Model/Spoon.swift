//
//  Spoon.swift
//  Hungry Developers
//
//  Created by Joel Groomer on 11/5/19.
//  Copyright © 2019 Julltron. All rights reserved.
//

import Foundation
import UIKit


class Spoon {
    let spoonNumber: Int
    let spoonLabel: UILabel
    var heldBy: Int = 0
    let lock = NSLock()
    
    init(spoonNumber: Int, spoonLabel: UILabel) {
        self.spoonNumber = spoonNumber
        self.spoonLabel = spoonLabel
    }
    
    func pickUp(by: Int) -> Bool {
//        if state == .notHeld {
//            state = .held
//            DispatchQueue.main.async {
//                self.spoonLabel.text = " \(by) "
//            }
//            return true
//        }
//        return false
        lock.lock()
        heldBy = by
        DispatchQueue.main.async {
            self.spoonLabel.text = " \(by) "
        }
        return true
    }
    
    func putDown() {
        DispatchQueue.main.async {
            self.spoonLabel.text = "🥄"
        }
        heldBy = 0
        lock.unlock()
//        state = .notHeld
    }
}
