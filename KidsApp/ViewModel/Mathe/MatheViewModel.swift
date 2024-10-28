//
//  MahteViewModel.swift
//  Kidsapp
//
//  Created by Jacqueline Kolbe on 02.09.24.
//

import Foundation
import Combine

class MahteViewModel: ObservableObject {
    @Published var currentQuestion: Question?
    @Published var score: Int = 0
    @Published var currentQuestionNumber: Int = 1
    @Published var timeLeft: Int = 60
    @Published var gameEnded: Bool = false
    
    private var level: Int
    private var timer: Timer?

    init(level: Int) {
        self.level = level
        startGame()
    }
    
    func startGame() {
        score = 0
        currentQuestionNumber = 1
        nextQuestion()
        startTimer()
    }
    
    func nextQuestion() {
        currentQuestion = Question.generateRandomQuestion(level: level)
        currentQuestionNumber += 1
    }

    private func startTimer() {
        timer?.invalidate()
        timeLeft = 60
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.timeLeft > 0 {
                self.timeLeft -= 1
            } else {
                self.endGame()
            }
        }
    }

    func selectOption(_ option: Int) {
        guard let currentQuestion = currentQuestion else { return }
        if option == currentQuestion.correctOption {
            score += 10
            nextQuestion()
        } else {
            endGame()
        }
    }

    private func endGame() {
        timer?.invalidate()
        gameEnded = true
    }

    func resetGame() {
        gameEnded = false
        startGame()
    }
}
