//
//  MatheView.swift
//  Kidsapp
//
//  Created by Jacqueline Kolbe on 02.09.24.
//

import SwiftUI

struct MatheView: View {
    @ObservedObject var viewModel: MahteViewModel
    
    var body: some View {
        ZStack {
            // Hintergrundbild
            Image("hintergrund")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                if viewModel.gameEnded {
                    Text("Deine Punkte: \(viewModel.score)")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Button(action: {
                        viewModel.resetGame()
                    }) {
                        Text("Neustarten")
                            .font(.title)
                            .padding()
                            .background(Color.turquoise)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                    .onAppear {
                        // Sound abspielen, wenn das Spiel endet
                        SoundManager.instance.playSound(soundName: "matheende")
                    }
                } else {
                    // Zeitablauf als Kreis mit dynamischen Farben
                    ZStack {
                        Circle()
                            .stroke(Color.gray.opacity(0.3), lineWidth: 10) // Hintergrundkreis
                            .frame(width: 80, height: 80)
                        
                        Circle()
                            .trim(from: 0, to: CGFloat(viewModel.timeLeft) / 60) // Fortschrittskreis basierend auf verbleibender Zeit
                            .stroke(getTimeColor(), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                            .rotationEffect(.degrees(-90)) // Startposition auf 12 Uhr
                            .frame(width: 80, height: 80)
                        
                        Text("\(viewModel.timeLeft) s")
                            .font(.largeTitle)
                            .foregroundColor(getTimeColor())
                    }
                    
                    Text("Aufgabe \(viewModel.currentQuestionNumber)/15")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    if let question = viewModel.currentQuestion {
                        Text(question.question)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        
                        ForEach(0..<question.options.count, id: \.self) { index in
                            Button(action: {
                                viewModel.selectOption(index)
                            }) {
                                Text(question.options[index])
                                    .font(.title)
                                    .padding()
                                    .background(Color.gelb)
                                    .foregroundColor(.black)
                                    .cornerRadius(10)
                            }
                            .padding(.top)
                        }
                    }
                    
                    Text("Score: \(viewModel.score)")
                        .font(.title)
                        .foregroundColor(.green)
                }
            }
            .padding()
            .onAppear {
                viewModel.startGame()
            }
        }
    }
    
    // Zeit läuft ab und die farbe ändert sich
    private func getTimeColor() -> Color {
        switch viewModel.timeLeft {
        case 37...60:
            return .green // 60% - 100% der Zeit
        case 13...36:
            return .yellow // 20% - 60% der Zeit
        case 0...12:
            return .red // 0% - 20% der Zeit
        default:
            return .green
        }
    }
}

#Preview {
    MatheView(viewModel: MahteViewModel(level: 1)) // Hier den Level übergeben
}
