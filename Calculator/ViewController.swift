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
    var last_op2:Double=0
    var last_operation:String=""
    var lastOp=false
    @IBOutlet var numbers: [UIButton]!
    @IBOutlet weak var display: UILabel!
    @IBAction func numberPressed(_ sender: UIButton) {
        if display.text!.count>12 || display.text!=="OVERLOAD"{
//            display.text="OVERLOAD"
            return
        }
        if operation=="="{
            display.text=""
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
        lastOp=false
        if display.text=="OVERLOAD"{
            return
        }
        
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
        lastOp=false
        if display.text=="OVERLOAD"{
            return
        }
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
        lastOp=false
        if display.text=="OVERLOAD"{
            return
        }
        if display.text!.count==0{
            op_1=0
        }
        else{
            op_1=Double(display.text!)!
        }
        display.text=""
        operation="*"
    }
    @IBAction func dividePushed(_ sender: UIButton) {
        lastOp=false
        if display.text=="OVERLOAD"{
            return
        }
        if display.text!.count==0{
            op_1=0
        }
        else{
            op_1=Double(display.text!)!
        }
        display.text=""
        operation="/"
    }
    
    @IBAction func modPushed(_ sender: UIButton) {
        if display.text=="OVERLOAD"{
            return
        }
        if display.text!.count==0{
            display.text="0"
        }
        display.text=String(Double(display.text!)!/100)
    }
    @IBAction func resetPushed(_ sender: UIButton) {
        display.text=""
        op_1=0
        op_2=0
        operation=""
    }
    @IBAction func signPushed(_ sender: UIButton) {
        if display.text=="OVERLOAD"{
            return
        }
        if display.text!.count==0{
            return
        }
        var number:Double = Double(display.text!)!
        number = -number
        if floor(number)==number{
            display.text=String(Int(number))
        }
        else{
            display.text=String(number)
        }
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
        if lastOp && operation=="="{
            op_1=Double(display.text!)!
            op_2=last_op2
            operation=last_operation
        }
        if operation=="+"{
            if floor(op_1+op_2)==op_1+op_2{
                display.text=String(Int(op_1+op_2))
            }
            else{
                let numDigits=String(Int(op_1+op_2)).count
                display.text=String(format:"%.\(11-numDigits)f",op_1+op_2)
            }
            op_1=0
            last_op2=op_2
            op_2=0
            operation=""
            lastOp=true
            last_operation="+"
//            op_1=op_2
        }
        else if operation=="-"{
            if floor(op_1-op_2)==op_1-op_2{
                display.text=String(Int(op_1-op_2))
            }
            else{
                let numDigits=String(Int(op_1-op_2)).count
                display.text=String(format:"%.\(11-numDigits)f",op_1-op_2)
            }
            op_1=0
            last_op2=op_2
            op_2=0
            operation=""
            lastOp=true
            last_operation="-"
//            op_1=op_2
        }
        else if operation=="*"{
            if floor(op_1*op_2)==op_1*op_2{
                display.text=String(Int(op_1*op_2))
            }
            else{
                let numDigits=String(Int(op_1*op_2)).count
                display.text=String(format:"%.\(11-numDigits)f",op_1*op_2)
            }
            op_1=0
            last_op2=op_2
            op_2=0
            operation=""
            lastOp=true
            last_operation="*"
        }
        else if operation=="/"{
            if floor(op_1/op_2)==op_1/op_2{
                display.text=String(Int(op_1/op_2))
            }
            else{
                let numDigits=String(Int(op_1/op_2)).count
                display.text=String(format:"%.\(11-numDigits)f",op_1/op_2)
            }
            op_1=0
            last_op2=op_2
            op_2=0
            operation=""
            lastOp=true
            last_operation="/"
            
        }
        operation="="
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

