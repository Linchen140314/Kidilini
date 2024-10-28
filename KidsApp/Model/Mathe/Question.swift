//
//  Question.swift
//  Kidsapp
//
//  Created by Jacqueline Kolbe on 02.09.24.
//

import Foundation

struct Question {
    let question: String
    let options: [String]
    let correctOption: Int
    
    static func generateRandomQuestion(level: Int) -> Question {
        let num1: Int
        let num2: Int
        
        switch level {
        case 1:
            num1 = Int.random(in: 0...10)
            num2 = Int.random(in: 0...10)
            return createMixedQuestion(num1: num1, num2: num2, operations: ["+", "-"]) // Plus und Minus
        case 2:
            num1 = Int.random(in: 0...20)
            num2 = Int.random(in: 0...20)
            return createMixedQuestion(num1: num1, num2: num2, operations: ["+", "-", "*"]) // Plus, Minus, Multiplikation
        case 3:
            num1 = Int.random(in: 0...50)
            num2 = Int.random(in: 0...50)
            return createMixedQuestion(num1: num1, num2: num2, operations: ["+", "-", "*", "/"]) // Plus, Minus, Multiplikation, Division
        case 4:
            num1 = Int.random(in: 0...100)
            num2 = Int.random(in: 0...100)
            return createMixedQuestion(num1: num1, num2: num2, operations: ["+", "-", "*", "/"]) // Plus, Minus, Multiplikation, Division
        default:
            return createAdditionQuestion(num1: 0, num2: 0) // Default
        }
    }
    
    private static func createAdditionQuestion(num1: Int, num2: Int) -> Question {
        let correctAnswer = num1 + num2
        let options = generateOptions(correctAnswer: correctAnswer)
        
        return Question(question: "\(num1) + \(num2)?", options: options, correctOption: options.firstIndex(of: String(correctAnswer))!)
    }
    
    private static func createMixedQuestion(num1: Int, num2: Int, operations: [String]) -> Question {
        let operation = operations.randomElement()!
        var correctAnswer: Int
        
        switch operation {
        case "+":
            correctAnswer = num1 + num2
            return createQuestion(num1: num1, num2: num2, operation: "+", correctAnswer: correctAnswer)
        case "-":
            let largerNumber = max(num1, num2)
            let smallerNumber = min(num1, num2)
            correctAnswer = largerNumber - smallerNumber
            return createQuestion(num1: largerNumber, num2: smallerNumber, operation: "-", correctAnswer: correctAnswer)
        case "*":
            let mulNum1 = Int.random(in: 1...10)
            let mulNum2 = Int.random(in: 1...10)
            correctAnswer = mulNum1 * mulNum2
            return createQuestion(num1: mulNum1, num2: mulNum2, operation: "*", correctAnswer: correctAnswer)
        case "/":
            let divisor = Int.random(in: 1...10)
            let dividend = divisor * Int.random(in: 1...10) // Ergebnis bleibt ganzzahlig
            correctAnswer = dividend / divisor
            return createQuestion(num1: dividend, num2: divisor, operation: "/", correctAnswer: correctAnswer)
        default:
            return createAdditionQuestion(num1: 0, num2: 0) // Default
        }
    }
    
    private static func createQuestion(num1: Int, num2: Int, operation: String, correctAnswer: Int) -> Question {
        let questionString = "\(num1) \(operation) \(num2)?"
        let options = generateOptions(correctAnswer: correctAnswer)
        
        return Question(question: questionString, options: options, correctOption: options.firstIndex(of: String(correctAnswer))!)
    }
    
    private static func generateOptions(correctAnswer: Int) -> [String] {
        var options = [String]()
        options.append(String(correctAnswer))
        
        while options.count < 3 {
            let wrongAnswer = correctAnswer + Int.random(in: -10..<10)
            if wrongAnswer >= 0 && !options.contains(String(wrongAnswer)) {
                options.append(String(wrongAnswer))
            }
        }
        
        return options.shuffled()
    }
}
