//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Lourenço Gomes on 09/03/18.
//  Copyright © 2018 Lourenço Gomes. All rights reserved.
//

import Foundation

class CalculatorBrain {
    
    
    private var accumulator = 0.0
    
    func setOperand (orperand:Double){
        accumulator = orperand
    }
    
    var result : Double {
        get{
            return accumulator
        }
    }
    
    var operations : Dictionary<String, Operation> = [
        "𝜋" : Operation.Constant(Double.pi),
        "√" : Operation.UnaryOperation(sqrt),
        "sin" : Operation.UnaryOperation(sin),
        "cos" : Operation.UnaryOperation(cos),
        "+" : Operation.BinaryOperation(+),
        "-" : Operation.BinaryOperation(-),
        "×" : Operation.BinaryOperation(*),
        "÷" : Operation.BinaryOperation(/),
        "=" : Operation.Equals
        
    ]
    
    
    enum Operation {
        case Constant(Double)
        case UnaryOperation((Double)->Double)
        case BinaryOperation((Double,Double)->Double)
        case Equals
    }
    
    var pending : PendingBinaryOperationInfo?
    
    
    func preformOperation (symbol: String){
        if let operation = operations[symbol]{
            
            switch operation {
            case .Constant(let value):
                accumulator = value
            case .UnaryOperation(let foo):
                accumulator = foo(accumulator)
            case .BinaryOperation(let foo):
                pending = PendingBinaryOperationInfo (binaryFunction: foo, firstOperand: accumulator)
            case .Equals:
                if (pending != nil){
                    accumulator = pending!.binaryFunction(pending!.firstOperand,accumulator)
                }
            }
            
        }
    }
    
    struct PendingBinaryOperationInfo {
        var binaryFunction : ((Double,Double)->Double)
        var firstOperand : Double
    }
    
    
}
