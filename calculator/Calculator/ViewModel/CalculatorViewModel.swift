//
//  CalculatorViewModel.swift
//  calculator
//
//  Created by Kushboo Patel on 3/7/24.
//

import Foundation
import CalculatorFramework

class CalculatorViewModel: ObservableObject {
    @Published var userInput: String = ""
    var numberOne: String = ""
    var calculationOperator: String = ""
    let calculate = Calculate()
    
    func recieveInput(button: CalculatorButton) {
    
        switch button {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            if calculationOperator.isEmpty {
                userInput += button.title
            }
            else {
                userInput = button.title
            }
        case .add, .substract, .mutliply, .divide:
            if !calculationOperator.isEmpty {
                userInput = calculateOutput()
            }
                calculationOperator = button.title
                numberOne = userInput
        case .sin, .cos, .tan:
           let output =  calculateTrigonometricOutput(button: button)
            userInput = String(output)
        case .equals:
          userInput = calculateOutput()
            calculationOperator = ""
            numberOne = ""
        case .clear:
            userInput = ""
            calculationOperator = ""
            numberOne = ""
        default:
            break
        }
    }
    func calculateTrigonometricOutput(button: CalculatorButton) -> Double {
        let angleInDegrees = Double(userInput) ?? 0.00
        let angleInRadians = angleInDegrees * Double.pi / 180.0
        switch button {
            case .sin:
                return sin(angleInRadians)
            case .cos:
                return cos(angleInRadians)
            case .tan:
                return tan(angleInRadians)
        default: break
            }
        return 0.00
    }
    func calculateOutput() -> String {
        var output: NSNumber = 0
        print(numberOne, calculationOperator, userInput)
        switch calculationOperator {
        case "+":
            output = Calculate.add(NSNumber(value: (Int(numberOne) ?? 0)), to: NSNumber(value: (Int(userInput) ?? 0)))
                
        case "-":
            output = Calculate.subtract(NSNumber(value: (Int(userInput) ?? 0)), from: NSNumber(value: (Int(numberOne) ?? 0)))
        case "x":
            output = Calculate.multiply(NSNumber(value: (Int(numberOne) ?? 0)), by: NSNumber(value: Int(userInput) ?? 0))
            
        case "/" :
            output = Calculate.divide(NSNumber(value: Int(numberOne) ?? 0), by: NSNumber(value: Int(userInput) ?? 0))
           
        default:
        break
        }
        return String(output.intValue)
    }
}
