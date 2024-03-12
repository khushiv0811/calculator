//
//  CalculatorButtons.swift
//  calculator
//
//  Created by Kushboo Patel on 3/7/24.
//

import Foundation
import SwiftUI

enum CalculatorButton: String {
    case zero, one, two, three, four, five, six, seven, eight, nine
    case add, substract, mutliply, divide, equals
    case clear, point
    case sin, cos, tan
    
    var backgroundColor: Color {
        switch self {
        case .add, .substract, .mutliply, .divide:
            return Color(.orange)
        case .sin, .tan, .cos, .point:
            return Color(.lightGray)
        default:
            return Color(.darkGray)
        }
    }
    
    var title: String {
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .add: return "+"
        case .substract: return "-"
        case .mutliply: return "x"
        case .divide: return "/"
        case .clear: return "AC"
        case .equals: return "="
        case .sin: return "sin"
        case .cos: return "cos"
        case .tan: return "tan"
        case .point: return "."
        }
    }
}
