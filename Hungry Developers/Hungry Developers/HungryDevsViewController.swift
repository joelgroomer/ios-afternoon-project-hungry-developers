//
//  HungryDevsViewController.swift
//  Hungry Developers
//
//  Created by Joel Groomer on 11/5/19.
//  Copyright © 2019 Julltron. All rights reserved.
//

import UIKit

class HungryDevsViewController: UIViewController {
    // starting at 12, moving clockwise
    @IBOutlet weak var lblDev1: UILabel!
    @IBOutlet weak var lblSpoon1: UILabel!
    @IBOutlet weak var lblDev2: UILabel!
    @IBOutlet weak var lblSpoon2: UILabel!
    @IBOutlet weak var lblDev3: UILabel!
    @IBOutlet weak var lblSpoon3: UILabel!
    @IBOutlet weak var lblDev4: UILabel!
    @IBOutlet weak var lblSpoon4: UILabel!
    @IBOutlet weak var lblDev5: UILabel!
    @IBOutlet weak var lblSpoon5: UILabel!
    @IBOutlet weak var txtvOutput: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let spoon1 = Spoon(spoonNumber: 1, spoonLabel: lblSpoon1)
        let spoon2 = Spoon(spoonNumber: 2, spoonLabel: lblSpoon2)
        let spoon3 = Spoon(spoonNumber: 3, spoonLabel: lblSpoon3)
        let spoon4 = Spoon(spoonNumber: 4, spoonLabel: lblSpoon4)
        let spoon5 = Spoon(spoonNumber: 5, spoonLabel: lblSpoon5)
        let dev1 = Developer(devNumber: 1, leftSpoon: spoon1, rightSpoon: spoon5, devLabel: lblDev1, delegate: self)
        let dev2 = Developer(devNumber: 2, leftSpoon: spoon2, rightSpoon: spoon1, devLabel: lblDev2, delegate: self)
        let dev3 = Developer(devNumber: 3, leftSpoon: spoon3, rightSpoon: spoon2, devLabel: lblDev3, delegate: self)
        let dev4 = Developer(devNumber: 4, leftSpoon: spoon4, rightSpoon: spoon3, devLabel: lblDev4, delegate: self)
        let dev5 = Developer(devNumber: 5, leftSpoon: spoon5, rightSpoon: spoon4, devLabel: lblDev5, delegate: self)
        let developers = [dev1, dev2, dev3, dev4, dev5]
        
        DispatchQueue.concurrentPerform(iterations: 5) {
            developers[$0].run()
        }
    }

}
