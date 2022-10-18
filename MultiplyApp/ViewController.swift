//
//  ViewController.swift
//  MultiplyApp
//
//  Created by  on 9/29/22.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var lastLabel: UILabel!
    @IBOutlet weak var opLabel: UILabel!
    
    //used to write the number in disp label
    var isNeg:Bool = false
    var beforePoint:String = ""
    var dotted:Bool = false
    var afterPoint:String = ""
    var opSet:Bool = false
    var op:String = ""
    var resultDisplayed = false
    var acceptingOp = true
    
    var last:Double = 0
    var result:Double = 0
    var disp:String = ""

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myLabel.text = disp
        
    }

    func typeNumber(num:Int){
        if resultDisplayed{
            disp = ""
            beforePoint = ""
            afterPoint = ""
            dotted = false
            writeDisp()
            lastLabel.text = ""
            opLabel.text = ""
            acceptingOp = true
            resultDisplayed = false
        }
        if !dotted {
            beforePoint += "\(num)"
        }
        else {
            afterPoint += "\(num)"
        }
        writeDisp()
        }
    
    func writeDisp(){
        disp = ""
        if isNeg {disp += "-"}
        disp += "\(beforePoint)"
        if dotted {
            disp += "."
            disp += "\(afterPoint)"
        }
        myLabel.text = disp
    }
    
    func op(operation:String){
        if acceptingOp {
        if !opSet{
            last = Double(disp) ?? 0
            disp = ""
            dotted = false
            lastLabel.text = "\(last)"
            beforePoint = ""
            afterPoint = ""
            myLabel.text = ""
        }
        op = operation
        opSet = true
        opLabel.text = operation
        isNeg = false
    }
    }
    
    @IBAction func one(_ sender: UIButton) {
        typeNumber(num: 1
        )
    }
    
    @IBAction func two(_ sender: UIButton) {
        typeNumber(num: 2
        )
    }
    
    @IBAction func three(_ sender: UIButton) {
        typeNumber(num: 3
        )
    }
    
    @IBAction func four(_ sender: UIButton) {
        typeNumber(num: 4
        )
    }
    
    @IBAction func five(_ sender: UIButton) {
        typeNumber(num: 5
        )
    }
    
    @IBAction func six(_ sender: UIButton) {
        typeNumber(num: 6
        )
    }
    
    @IBAction func seven(_ sender: UIButton) {
        typeNumber(num: 7
        )
    }
    
    @IBAction func eight(_ sender: UIButton) {
        typeNumber(num: 8
        )
    }
    
    @IBAction func nine(_ sender: UIButton) {
        typeNumber(num: 9
        )
    }
    
    @IBAction func zero(_ sender: UIButton) {
        typeNumber(num: 0
        )
    }
    
    @IBAction func negative(_ sender: UIButton) {
        if !isNeg {
            isNeg = true
        }
        else{
         isNeg = false
        }
        writeDisp()
    }
    
    @IBAction func equals(_ sender: UIButton) {
        switch op {
        case "+":
            result = last + (Double(disp) ?? 0)
            myLabel.text = "\(result)"
            resultDisplayed = true
        case "-":
            result = last - (Double(disp) ?? 0)
            myLabel.text = "\(result)"
            resultDisplayed = true
        case "*":
            result = last * (Double(disp) ?? 0)
            myLabel.text = "\(result)"
            resultDisplayed = true
        case "/":
            result = last / (Double(disp) ?? 0)
            myLabel.text = "\(result)"
            resultDisplayed = true
        default:
            break
        }
        if (op == "/" && (Double(disp) ?? 0) == 0){
            view.backgroundColor = UIColor.red
            myLabel.text = "WHAT have you DONE?"
        }
        acceptingOp = false
        opSet = false
        op = ""
        last = 0
        beforePoint = ""
        afterPoint = ""
        dotted = false
        lastLabel.text = ""
        opLabel.text = ""
    }
    
    @IBAction func plus(_ sender: UIButton) {
        op(operation: "+")

    }
    
    @IBAction func minus(_ sender: UIButton) {
        op(operation: "-")

    }
    
    @IBAction func multiply(_ sender: UIButton) {
        op(operation: "*")

    }
    
    @IBAction func divide(_ sender: UIButton) {
        op(operation: "/")
    }
    
    @IBAction func dot(_ sender: UIButton) {
       dotted = true
        writeDisp()
    }
}

