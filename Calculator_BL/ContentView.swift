//
//  ContentView.swift
//  Calculator_BL
//
//  Created by Brendan Lenzner on 6/30/20.
//  Copyright © 2020 Brendan Lenzner. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var firstNumber = 0
    @State private var secondNumber = 0
    @State private var operand = ""
    @State private var calculatorText = "0"
    @State private var isTypingNumber = false
    
    @Environment(\.colorScheme) var colorScheme
    
    // 1.
    private func createCalcDigit(_ number: String) -> Button<Text> {
        return Button(action: {
            self.digitTapped(number)
        }) {
            (Text(number))
        }
    }

    // 2.
    private func digitTapped(_ number: String) -> Void {
        if isTypingNumber {
            calculatorText += number
        } else {
            calculatorText = number
            isTypingNumber = true
        }
    }

    // 3.
    private func operatorTapped(_ operand: String) {
        isTypingNumber = false
        firstNumber = Int(calculatorText)!
        self.operand = operand
        calculatorText = operand
    }

    // 4.
    private func calculate() {
        isTypingNumber = false
        var result  = 0
        secondNumber = Int(calculatorText)!

        if operand == "+" {
            result = firstNumber + secondNumber
        } else if operand == "-" {
            result = firstNumber - secondNumber
        }

        calculatorText = "\(result)"
    }
    private func clear() {
        firstNumber = 0
        secondNumber = 0
        operand = ""
        calculatorText = "0"
        isTypingNumber = false
    }
    
    var body: some View {
        VStack(spacing: 30) {
            // 1.
            TextField("0", text: $calculatorText)
                .padding()
                .multilineTextAlignment(.trailing)

            HStack {
                // 2.
                createCalcDigit("1")
                    .padding(.horizontal)
                Spacer()
                createCalcDigit("2")
                .padding(.horizontal)
                Spacer()
                createCalcDigit("3")
               .padding(.horizontal)
            }.padding()

            HStack {
                createCalcDigit("4")
                .padding(.horizontal)
                Spacer()
                createCalcDigit("5")
                .padding(.horizontal)
                Spacer()
                createCalcDigit("6")
                .padding(.horizontal)
            }.padding()

            HStack {
                createCalcDigit("7")
                .padding(.horizontal)
                Spacer()
                createCalcDigit("8")
                .padding(.horizontal)
                Spacer()
                createCalcDigit("9")
                .padding(.horizontal)
            }.padding()

            HStack {
                // 3.
                Button(action: {
                    self.operatorTapped("-")
                }) {
                    (Text("-"))
                }
                .padding(.horizontal)
                Spacer()
                createCalcDigit("0")
                .padding(.horizontal)
                Spacer()
                Button(action: {
                    self.operatorTapped("+")
                }) {
                    (Text("+"))
                }
                .padding(.horizontal)

            }.padding()

            HStack {
                Button(action: {
                    self.operatorTapped("x")
                }) {
                    (Text("x"))
                }
                .padding(.horizontal)
                Spacer()
                
                
                Button(action: {
                    self.operatorTapped("/")
                }) {
                    (Text("/"))
                }
                .padding(.horizontal)
                Spacer()

                Button(action: {
                    self.clear()
                }) {
                    (Text("C"))
                }
                .padding(.horizontal)
                
               .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            }.padding()
            HStack{
                Button(action: {
                    self.calculate()
                }) {
                    (Text("="))
                }
                .padding(.horizontal)
            }.padding()
        }
        .font(.largeTitle)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
