//
//  Spoon.swift
//  Hungry Developers
//
//  Created by Joel Groomer on 11/7/19.
//  Copyright © 2019 Julltron. All rights reserved.
//

import Foundation

class Spoon {
    let spoonID: Int
    var heldBy: Int = 0
    let lock = NSLock()
    
    init(id: Int) {
        self.spoonID = id
    }
    
    func pickUp(by dev: Int) {
        lock.lock()
        heldBy = dev
        print("spoon \(spoonID) picked up by dev \(dev).")
    }
    
    func putDown() {
        heldBy = 0
        print("spoon \(spoonID) put down.")
        lock.unlock()
    }
}
