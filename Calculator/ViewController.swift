//
//  ViewController.swift
//  Calculator
//
//  Created by Lourenço Gomes on 06/03/18.
//  Copyright © 2018 Lourenço Gomes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var brain = CalculatorBrain()
    
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
        
        if userIsIntheMiddleOfTyping {
            brain.setOperand(orperand: displayValue)
        }
        userIsIntheMiddleOfTyping = false
        brain.preformOperation(symbol: sender.title(for: .normal)!)
        displayValue = brain.result
    }
    
}

