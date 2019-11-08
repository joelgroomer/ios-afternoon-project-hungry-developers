//
//  ViewController.swift
//  Hungry Developers
//
//  Created by Joel Groomer on 11/7/19.
//  Copyright © 2019 Julltron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let spoon1 = Spoon(id: 1)
    let spoon2 = Spoon(id: 2)
    let spoon3 = Spoon(id: 3)
    let spoon4 = Spoon(id: 4)
    let spoon5 = Spoon(id: 5)
    let dev1: Developer
    let dev2: Developer
    let dev3: Developer
    let dev4: Developer
    let dev5: Developer
    let developers: [Developer]
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        dev1 = Developer(id: 1, leftSpoon: spoon1, rightSpoon: spoon5)
        dev2 = Developer(id: 2, leftSpoon: spoon2, rightSpoon: spoon1)
        dev3 = Developer(id: 3, leftSpoon: spoon3, rightSpoon: spoon2)
        dev4 = Developer(id: 4, leftSpoon: spoon4, rightSpoon: spoon3)
        dev5 = Developer(id: 5, leftSpoon: spoon5, rightSpoon: spoon4)
        developers = [dev1, dev2, dev3, dev4, dev5]
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        dev1 = Developer(id: 1, leftSpoon: spoon1, rightSpoon: spoon5)
        dev2 = Developer(id: 2, leftSpoon: spoon2, rightSpoon: spoon1)
        dev3 = Developer(id: 3, leftSpoon: spoon3, rightSpoon: spoon2)
        dev4 = Developer(id: 4, leftSpoon: spoon4, rightSpoon: spoon3)
        dev5 = Developer(id: 5, leftSpoon: spoon5, rightSpoon: spoon4)
        developers = [dev1, dev2, dev3, dev4, dev5]
        
        super.init(coder: coder)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startTapped(_ sender: Any) {
        print("Starting...")
        DispatchQueue.concurrentPerform(iterations: 5) {
            developers[$0].run()
        }
    }
    
}

