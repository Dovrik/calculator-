//
//  ViewController.swift
//  Calculator
//
//  Created by Dovran on 26.08.17.
//  Copyright © 2017 Dovran Reyimov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayResultLabel: UILabel!
    
    var stillTyping = false
    var dotIsPlaced = false
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operationSign: String = ""
    
    
    var currentInput: Double {
        get {
            return Double(displayResultLabel.text!)!
        } set {
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: String("."))
            if valueArray[1] == "0" {
                displayResultLabel.text = "\(valueArray[0])"
            } else {
                displayResultLabel.text = "\(newValue)"
            }
            stillTyping = false
        }
    }
    
    //Статус бар делаем белым
    
    @IBAction func numberPressed(_ sender: UIButton) {
        
        
        let number = sender.currentTitle!
        
        if stillTyping {
            //Ограничиваем кол-во набранных цыфр
            if (displayResultLabel.text?.characters.count)! < 20 {
                
                displayResultLabel.text = displayResultLabel.text! + number
            }
        } else {
            displayResultLabel.text = number
            stillTyping = true
        }
        
    }
    @IBAction func twoOpperandsSignPressed(_ sender: UIButton) {
        operationSign = sender.currentTitle!
        firstOperand = currentInput
        stillTyping = false
        dotIsPlaced = false
    }
    
    func operateWithTwoOperands(operation: (Double,Double) -> Double) {
        currentInput = operation(firstOperand,secondOperand)
        stillTyping = false
    }
    
    @IBAction func equalitySignPress(_ sender: UIButton) {
        
        if stillTyping {
            secondOperand = currentInput
        }
        
        dotIsPlaced = false
        
        switch operationSign {
            
        case "+":
            operateWithTwoOperands{ $0 + $1 }
        case "-":
            operateWithTwoOperands{ $0 - $1 }
        case "×":
            operateWithTwoOperands{ $0 * $1 }
        case "÷":
            operateWithTwoOperands{ $0 / $1 }
        default: break
            
        }
    }
    
    @IBAction func clearButtonPress(_ sender: UIButton) {
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        displayResultLabel.text = "0"
        stillTyping = false
        dotIsPlaced = false
        operationSign = ""
    }
    
    @IBAction func plusMinusButtonPressed(_ sender: UIButton) {
        currentInput = -currentInput
    }
    
    @IBAction func percentageButtonPressed(_ sender: UIButton) {
        if firstOperand == 0 {
        currentInput = currentInput / 100
        } else {
            secondOperand = firstOperand * currentInput / 100
        }
        stillTyping = false
    }
    
    @IBAction func squareRootButtonPressed(_ sender: UIButton) {
        currentInput = sqrt(currentInput)
    }
    
    @IBAction func dotButtonPressed(_ sender: UIButton) {
        if stillTyping && !dotIsPlaced {
            displayResultLabel.text = displayResultLabel.text! + "."
            dotIsPlaced = true
        } else if !stillTyping && !dotIsPlaced {
            displayResultLabel.text = "0."
        }
    }
   
    @IBOutlet weak var allNumber: UIButton!
    @IBOutlet weak var C: UIButton!
    @IBOutlet weak var PlusMinus: UIButton!
    @IBOutlet weak var percent: UIButton!
    @IBOutlet weak var Plus: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var fore: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var umnojyt: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var delit: UIButton!
    @IBOutlet weak var koren: UIButton!
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var dot: UIButton!
    @IBOutlet weak var rawno: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        C.layer.borderWidth = 2
        C.layer.borderColor = UIColor.red.cgColor
        C.layer.cornerRadius = 5
        
        PlusMinus.layer.borderWidth = 1
        PlusMinus.layer.borderColor = UIColor.green.cgColor
        PlusMinus.layer.cornerRadius = 5
        
        percent.layer.borderWidth = 1
        percent.layer.borderColor = UIColor.green.cgColor
        percent.layer.cornerRadius = 5
        
        Plus.layer.borderWidth = 1
        Plus.layer.borderColor = UIColor.green.cgColor
        Plus.layer.cornerRadius = 5
        
        seven.layer.borderWidth = 1
        seven.layer.borderColor = UIColor.green.cgColor
        seven.layer.cornerRadius = 5
        
        eight.layer.borderWidth = 1
        eight.layer.borderColor = UIColor.green.cgColor
        eight.layer.cornerRadius = 5
        
        nine.layer.borderWidth = 1
        nine.layer.borderColor = UIColor.green.cgColor
        nine.layer.cornerRadius = 5
        
        minus.layer.borderWidth = 1
        minus.layer.borderColor = UIColor.green.cgColor
        minus.layer.cornerRadius = 5
        
        fore.layer.borderWidth = 1
        fore.layer.borderColor = UIColor.green.cgColor
        fore.layer.cornerRadius = 5
        
        five.layer.borderWidth = 1
        five.layer.borderColor = UIColor.green.cgColor
        five.layer.cornerRadius = 5
        
        six.layer.borderWidth = 1
        six.layer.borderColor = UIColor.green.cgColor
        six.layer.cornerRadius = 5
        
        umnojyt.layer.borderWidth = 1
        umnojyt.layer.borderColor = UIColor.green.cgColor
        umnojyt.layer.cornerRadius = 5
        
        one.layer.borderWidth = 1
        one.layer.borderColor = UIColor.green.cgColor
        one.layer.cornerRadius = 5
        
        two.layer.borderWidth = 1
        two.layer.borderColor = UIColor.green.cgColor
        two.layer.cornerRadius = 5
        
        three.layer.borderWidth = 1
        three.layer.borderColor = UIColor.green.cgColor
        three.layer.cornerRadius = 5
        
        delit.layer.borderWidth = 1
        delit.layer.borderColor = UIColor.green.cgColor
        delit.layer.cornerRadius = 5
        
        koren.layer.borderWidth = 1
        koren.layer.borderColor = UIColor.green.cgColor
        koren.layer.cornerRadius = 5
        
        zero.layer.borderWidth = 0.5
        zero.layer.borderColor = UIColor.green.cgColor
        zero.layer.cornerRadius = 5
        
        dot.layer.borderWidth = 1
        dot.layer.borderColor = UIColor.green.cgColor
        dot.layer.cornerRadius = 5
        
        rawno.layer.borderWidth = 1
        rawno.layer.borderColor = UIColor.green.cgColor
        rawno.layer.cornerRadius = 5

        
    }
    
}

