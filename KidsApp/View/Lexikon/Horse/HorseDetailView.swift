//
//  HorseDetailView.swift
//  Kidsapp
//
//  Created by Jacqueline Kolbe on [Date].
//

import SwiftUI

struct HorseDetailView: View {
    let horse: Horse

    var body: some View {
        ZStack {
            // Hintergrundbild
            Image("hintergrund")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            // Inhalt
            VStack {
                Image(horse.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)

                Text(horse.name)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()

                Text(horse.description)
                    .font(.body)
                    .foregroundColor(.white)
                    .padding()

                Spacer()
            }
            .padding()
            .background(Color.white.opacity(0.1)) // Hintergrundfarbe mit Transparenz für besseren Kontrast
            .cornerRadius(15)

        }
        .navigationTitle(horse.name)
    }
}

#Preview {
    HorseDetailView(horse: Horse(name: "Arabisches Pferd", description: "Das Arabische Pferd ist bekannt für seine Geschwindigkeit, Ausdauer und eleganten Körperbau.", imageName: "arabian_horse"))
}

