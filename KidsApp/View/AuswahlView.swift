//
//  StartScreenView.swift
//  Kidsapp
//
//  Created by Jacqueline Kolbe on 28.08.24.
//

import SwiftUI
import CoreData

struct StartScreenView: View {
    @FetchRequest(entity: User.entity(), sortDescriptors: [])
    var users: FetchedResults<User>
    
    @State private var animateButton = false // State für die kontinuierliche Animation
    
    var body: some View {
        ZStack {
            Image("hintergrund") // Dein Hintergrundbild
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                if let user = users.first {
                    Text("Willkommen \(user.name ?? "Kind")!")
                        .font(.largeTitle)
                        .padding(10)
                        .foregroundColor(.white)
                } else {
                    Text("Willkommen")
                        .font(.largeTitle)
                        .padding(10)
                        .foregroundColor(.white)
                }

                // Animierter Button für "Lexika's"
                NavigationLink(destination: LexikonView()) {
                    Text("Lexika         ")
                        .font(.title)
                        .padding()
                        .background(Color.turquoise)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .scaleEffect(animateButton ? 1.1 : 1.0) // Animation: Pulsieren
                }
                .padding(.bottom, 10)

                // Animierter Button für "Mathe üben"
                NavigationLink(destination: MahteklassenView()) {
                    Text("Mathe üben")
                        .font(.title)
                        .padding()
                        .background(Color.turquoise)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .scaleEffect(animateButton ? 1.1 : 1.0) // Animation: Pulsieren
                }
                .padding(.bottom, 10)

                // Animierter Button für "Wetter"
                NavigationLink(destination: WeatherView()) {
                    Text("Wetter          ")
                        .font(.title)
                        .padding()
                        .background(Color.turquoise)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .scaleEffect(animateButton ? 1.1 : 1.0) // Animation: Pulsieren
                }
            }
            .padding()
            .onAppear {
                withAnimation(
                    Animation.easeInOut(duration: 1.0)
                        .repeatForever(autoreverses: true)
                ) {
                    animateButton.toggle() // Startet die Animation
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    StartScreenView()
}

