//
//  ViewController.swift
//  Calculator
//
//  Created by Ashwin Mahesh on 7/5/18.
//  Copyright © 2018 Ashwin Mahesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var op_1:Double=0
    var operation:String=""
    var op_2:Double=0
    @IBOutlet var numbers: [UIButton]!
    @IBOutlet weak var display: UILabel!
    @IBAction func numberPressed(_ sender: UIButton) {
        if display.text!.count>12 || display.text!=="OVERLOAD"{
            display.text="OVERLOAD"
            return
        }
        if display.text!.count==0 && sender.title(for: .normal)!=="."{
            display.text="0."
            return
        }
        else if sender.title(for: .normal)=="."{
            var dotAllowed=true
            for char in display.text!{
                if char=="."{
                    dotAllowed=false
                }
            }
            if dotAllowed==false{
                return
            }
        }
        display.text!.append(sender.title(for: .normal)!)
    }
    
    @IBAction func addPushed(_ sender: UIButton) {
        
        if display.text!.count==0{
            op_1=0
        }
        else{
            op_1=Double(display.text!)!
        }
        display.text=""
        operation="+"
    }
    @IBAction func subtractPushed(_ sender: UIButton) {
        if display.text!.count==0{
            op_1=0
        }
        else{
            op_1=Double(display.text!)!
        }
        display.text=""
        operation="-"
    }
    @IBAction func multiplyPushed(_ sender: UIButton) {
    }
    @IBAction func resetPushed(_ sender: UIButton) {
        display.text=""
        op_1=0
        op_2=0
        operation=""
    }
    @IBAction func signPushed(_ sender: UIButton) {
        if display.text!.count==0{
            return
        }
        var number:Double = Double(display.text!)!
        number = -number
        display.text=String(number)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        display.text=""
    }
    
    @IBAction func equalPushed(_ sender: UIButton) {
        if operation==""{
            return
        }
        if display.text!.count==0{
            op_2=0
        }
        else{
            op_2=Double(display.text!)!
        }
        if operation=="+"{
            if floor(op_1+op_2)==op_1+op_2{
                display.text=String(Int(op_1+op_2))
            }
            else{
            display.text=String(op_1+op_2)
            }
            op_1=0
            op_2=0
            operation=""
//            op_1=op_2
        }
        else if operation=="-"{
            if floor(op_1-op_2)==op_1-op_2{
                display.text=String(Int(op_1-op_2))
            }
            else{
                display.text=String(op_1-op_2)
            }
            op_1=0
            op_2=0
            operation=""
//            op_1=op_2
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

