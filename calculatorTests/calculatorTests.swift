//
//  calculatorTests.swift
//  calculatorTests
//
//  Created by Kushboo Patel on 3/7/24.
//

import XCTest
@testable import calculator

class CalculatorViewModelTests: XCTestCase {

    var viewModel: CalculatorViewModel!

    override func setUp() {
        super.setUp()
        viewModel = CalculatorViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testRecieveInput() {
        viewModel.recieveInput(button: .one)
        XCTAssertEqual(viewModel.userInput, "1")

        viewModel.recieveInput(button: .add)
        XCTAssertEqual(viewModel.calculationOperator, "+")
        XCTAssertEqual(viewModel.numberOne, "1")

        viewModel.recieveInput(button: .three)
        XCTAssertEqual(viewModel.userInput, "3")

        viewModel.recieveInput(button: .equals)
        XCTAssertEqual(viewModel.userInput, "4")
    }

    func testCalculateOutput() {
        viewModel.numberOne = "2"
        viewModel.userInput = "3"
        viewModel.calculationOperator = "+"
        XCTAssertEqual(viewModel.calculateOutput(), "5")

        viewModel.numberOne = "5"
        viewModel.userInput = "2"
        viewModel.calculationOperator = "-"
        XCTAssertEqual(viewModel.calculateOutput(), "3")

        viewModel.numberOne = "6"
        viewModel.userInput = "2"
        viewModel.calculationOperator = "x"
        XCTAssertEqual(viewModel.calculateOutput(), "12")

        viewModel.numberOne = "8"
        viewModel.userInput = "2"
        viewModel.calculationOperator = "/"
        XCTAssertEqual(viewModel.calculateOutput(), "4")
    }

    func testClear() {
        viewModel.userInput = "123"
        viewModel.numberOne = "456"
        viewModel.calculationOperator = "+"
        viewModel.recieveInput(button: .clear)
        XCTAssertEqual(viewModel.userInput, "")
        XCTAssertEqual(viewModel.numberOne, "")
        XCTAssertEqual(viewModel.calculationOperator, "")
    }
    
    func testCalculateTrigonometricOutput() {
            viewModel.userInput = "45"
            XCTAssertEqual(viewModel.calculateTrigonometricOutput(button: .sin), sin(45 * Double.pi / 180.0), accuracy: 0.0001)
            
            viewModel.userInput = "60"
            XCTAssertEqual(viewModel.calculateTrigonometricOutput(button: .cos), cos(60 * Double.pi / 180.0), accuracy: 0.0001)
            
            viewModel.userInput = "30"
            XCTAssertEqual(viewModel.calculateTrigonometricOutput(button: .tan), tan(30 * Double.pi / 180.0), accuracy: 0.0001)
        }

}
