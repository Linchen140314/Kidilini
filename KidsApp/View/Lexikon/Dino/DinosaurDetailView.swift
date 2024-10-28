//
//  DinosaurDetailView.swift
//  KidsApp
//
//  Created by Jacqueline Kolbe on 28.08.24.
//

import SwiftUI

struct DinosaurDetailView: View {
    let dinosaur: Dinosaur

    var body: some View {
        ZStack {
            // Hintergrundbild
            Image("hintergrund") // Stelle sicher, dass du ein passendes Hintergrundbild hast
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            // Inhalt
            VStack {
                Image(dinosaur.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)

                Text(dinosaur.name)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()

                Text(dinosaur.description)
                    .font(.body)
                    .foregroundColor(.white)
                    .padding()

                Spacer()
            }
            .padding()
            .background(Color.white.opacity(0.1)) // Hintergrundfarbe mit Transparenz für besseren Kontrast
            .cornerRadius(15)
        }
        .navigationTitle(dinosaur.name)
    }
}

#Preview {
    DinosaurDetailView(dinosaur: Dinosaur(name: "Tyrannosaurus Rex", description: "Tyrannosaurus Rex, oft als T-Rex bezeichnet, war ein großer fleischfressender Dinosaurier, der vor etwa 68 bis 66 Millionen Jahren lebte.", imageName: "tyrannosaurus"))
}
