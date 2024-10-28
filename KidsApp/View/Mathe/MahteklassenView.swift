//
//  MahteklassenView.swift
//  Kidsapp
//
//  Created by Jacqueline Kolbe on 03.09.24.
//

import SwiftUI

struct MahteklassenView: View {
    
    let soundManager = SoundManager.instance // Erstelle eine Instanz des SoundManagers
    
    var body: some View {
        
        ZStack {
            // Hintergrundbild
            Image("hintergrund")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            // Inhalt
            VStack {
                Text("Wähle deine Stufe")
                    .font(.largeTitle)
                    .foregroundColor(.white) // Textfarbe
                    .padding()

                // Stufe 1
                NavigationLink(destination: MatheView(viewModel: MahteViewModel(level: 1))) {
                    Text("Stufe 1")
                        .font(.title)
                        .padding()
                        .background(Color.turquoise)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                .padding(.bottom, 10)
                .simultaneousGesture(TapGesture().onEnded {
                    soundManager.playSound(soundName: "buttons") // Sound abspielen
                }) // Sound beim Button-Klick

                // Stufe 2
                NavigationLink(destination: MatheView(viewModel: MahteViewModel(level: 2))) {
                    Text("Stufe 2")
                        .font(.title)
                        .padding()
                        .background(Color.turquoise)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                .padding(.bottom, 10)
                .simultaneousGesture(TapGesture().onEnded {
                    soundManager.playSound(soundName: "buttons") // Sound abspielen
                }) // Sound beim Button-Klick
                
                // Stufe 3
                NavigationLink(destination: MatheView(viewModel: MahteViewModel(level: 3))) {
                    Text("Stufe 3")
                        .font(.title)
                        .padding()
                        .background(Color.turquoise)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                .padding(.bottom, 10)
                .simultaneousGesture(TapGesture().onEnded {
                    soundManager.playSound(soundName: "buttons") // Sound abspielen
                }) // Sound beim Button-Klick
                
                // Stufe 4
                NavigationLink(destination: MatheView(viewModel: MahteViewModel(level: 4))) {
                    Text("Stufe 4")
                        .font(.title)
                        .padding()
                        .background(Color.turquoise)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                .padding(.bottom, 10)
                .simultaneousGesture(TapGesture().onEnded {
                    soundManager.playSound(soundName: "buttons") // Sound abspielen
                }) // Sound beim Button-Klick
            }
            .padding()
        }
    }
}

#Preview {
    MahteklassenView()
}

