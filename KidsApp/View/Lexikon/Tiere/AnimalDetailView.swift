//
//  AnimalDetailView.swift
//  Kidsapp
//
//  Created by Jacqueline Kolbe on 28.08.24.
//

import SwiftUI

struct AnimalDetailView: View {
    let animal: Animal

    var body: some View {
        ZStack {
            // Hintergrundbild
            Image("hintergrund")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            // Inhalt
            VStack {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)


                Text(animal.name)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()

                Text(animal.description)
                    .font(.body)
                    .foregroundColor(.white)
                    .padding()

                Spacer()
            }
            .padding()
            .background(Color.white.opacity(0.1)) // Hintergrundfarbe mit Transparenz für besseren Kontrast
            .cornerRadius(15)

        }
        .navigationTitle(animal.name)
    }
}

#Preview {
    AnimalDetailView(animal: Animal(name: "Löwe", description: "Der Löwe ist ein großes Raubtier aus der Familie der Katzen.", imageName: "löwe"))
}


