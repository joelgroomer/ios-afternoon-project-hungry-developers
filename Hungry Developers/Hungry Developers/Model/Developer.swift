//
//  Developer.swift
//  Hungry Developers
//
//  Created by Joel Groomer on 11/5/19.
//  Copyright © 2019 Julltron. All rights reserved.
//

import Foundation
import UIKit

enum DeveloperState: String {
    case eating = "😋"
    case thinking = "🤔"
}

class Developer {
    let devNumber: Int
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    var holdingLeft = false
    var holdingRight = false
    let devLabel: UILabel
    var state: DeveloperState { didSet {
        DispatchQueue.main.async {
            self.devLabel.text = self.state.rawValue
        }
    }}
    private var running = false
    var delegate: HungryDevsViewController
    
    init(devNumber: Int, leftSpoon: Spoon, rightSpoon: Spoon, devLabel: UILabel, delegate: HungryDevsViewController) {
        self.devNumber = devNumber
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.devLabel = devLabel
        self.delegate = delegate
        self.state = .thinking
    }
    
    func think() {
        while !holdingLeft || !holdingRight {
            if !holdingLeft {
                holdingLeft = leftSpoon.pickUp(by: devNumber)
                if holdingLeft {
                    updateOutput("Dev number \(self.devNumber) picked up spoon \(self.leftSpoon.spoonNumber).")
                }
            }
            if !holdingRight {
                holdingRight = rightSpoon.pickUp(by: devNumber)
                if holdingRight {
                    updateOutput("Dev number \(self.devNumber) picked up spoon \(self.rightSpoon.spoonNumber).")
                }
            }
        }
        self.state = .eating
    }
    
    func eat() {
        sleep(2)
        leftSpoon.putDown()
        rightSpoon.putDown()
        self.state = .thinking
    }
    
    func run() {
        print("Dev \(devNumber) is starting.")
        updateOutput("Dev \(devNumber) is starting.")
        running = true
        while running {
            think()
            eat()
        }
    }
    
    func updateOutput(_ text: String) {
        DispatchQueue.main.async {
            self.delegate.txtvOutput.text += text
        }
    }
    
//    func stop() {
//
//    }
}
