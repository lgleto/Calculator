//
//  ViewController.swift
//  Calculator
//
//  Created by Lourenço Gomes on 06/03/18.
//  Copyright © 2018 Lourenço Gomes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var operand : Double = 0
    var operation : String = ""
    
    var userIsIntheMiddleOfTyping = false
    
    var displayValue : Double {
        get {
            return Double(labelDisplay.text!)!
        }
        set {
            labelDisplay.text = String(newValue)
        }
    }

    @IBOutlet weak var labelDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func digitPressed(_ sender: UIButton) {
        let buttonPressed = sender
        let textCurrentInDisplay = labelDisplay.text

        
        if userIsIntheMiddleOfTyping {
            labelDisplay.text = textCurrentInDisplay! + buttonPressed.title(for: .normal)!
        }else {
            labelDisplay.text =  buttonPressed.title(for: .normal)!
            userIsIntheMiddleOfTyping = true
        }
        
        
    }
    
    @IBAction func operationPressed(_ sender: UIButton) {
        let buttonPressed = sender
        if userIsIntheMiddleOfTyping {
        }
        
        var result = 0.0
        
        switch buttonPressed.title(for: .normal)! {
        case "+":
            operand = displayValue
            operation = buttonPressed.title(for: .normal)!
        case "=" :
            result = operand + displayValue
            displayValue = result
        default:
            result = 0
        }
        
        
        userIsIntheMiddleOfTyping = false
        
    }
    
}

