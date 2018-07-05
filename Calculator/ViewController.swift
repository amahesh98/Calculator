//
//  ViewController.swift
//  Calculator
//
//  Created by Ashwin Mahesh on 7/5/18.
//  Copyright © 2018 Ashwin Mahesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var numbers: [UIButton]!
    @IBOutlet weak var display: UILabel!
    @IBAction func numberPressed(_ sender: UIButton) {
        display.text!.append(sender.title(for: .normal)!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        display.text=""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

