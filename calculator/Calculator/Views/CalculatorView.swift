//
//  ContentView.swift
//  calculator
//
//  Created by Kushboo Patel on 3/7/24.
//

import SwiftUI

struct CalculatorView: View {
    @ObservedObject var viewModel = CalculatorViewModel()
    let buttons:[[CalculatorButton]] = [
        [.sin, .cos, .tan, .point],
        [.one, .two, .three, .add],
        [.four, .five, .six, .substract],
        [.seven, .eight, .nine, .mutliply],
        [.clear,.zero,.equals,.divide],
    ]
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                Color.black.ignoresSafeArea()
                VStack(spacing: 12) {
                    HStack {
                        Spacer()
                        self.createDisplay()
                    }
                    .padding(.trailing, 20)
                    
                    ForEach(buttons, id: \ .self) { rows in
                        HStack {
                            ForEach(rows, id: \ .self) { button in
                                
                                self.createCalculatorButton(button: button)
                                
                            }
                        }
                    }
                }
                .padding(.bottom, 20)
            }
        }
    }
    @ViewBuilder func createDisplay() -> some View {
        Text(viewModel.userInput)
            .foregroundStyle(Color.white)
            .font(.system(size: 72))
            .bold()
    }
    @ViewBuilder func createCalculatorButton(button: CalculatorButton) -> some View {
        Button {
            self.viewModel.recieveInput(button: button)
        } label: {
            Text(button.title)
                .font(.system(size: 32))
                .frame(width: self.calculateButtonWidth(), height: self.calculateButtonWidth())
                .foregroundColor(.white)
                .background(button.backgroundColor)
                .clipShape(Circle())
        }
        
    }
    private func calculateButtonWidth() -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
}

#Preview {
    CalculatorView()
}

