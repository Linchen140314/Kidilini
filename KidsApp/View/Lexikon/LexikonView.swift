//
//  LexikonView.swift
//  Kidsapp
//
//  Created by Jacqueline Kolbe on 02.09.24.
//

import SwiftUI

struct LexikonView: View {
    var body: some View {

            ZStack {
                // Hintergrundbild
                Image("hintergrund")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                // Inhalt
                VStack {
                    Text("Willkommen im Lexikon")
                        .font(.largeTitle)
                        .foregroundColor(.white) // Textfarbe
                        .padding()
                        .padding()

                    NavigationLink(destination: ContentView()) {
                        Text("Tier Lexikon      ")
                            .font(.title)
                            .padding()
                            .background(Color.gelb)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 10)

                    NavigationLink(destination: DinosaurListView()) {
                        Text("Dino Lexikon    ")
                            .font(.title)
                            .padding()
                            .background(Color.gelb)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 10)

                    NavigationLink(destination: HorseListView()) {
                        Text("Pferde Lexikon")
                            .font(.title)
                            .padding()
                            .background(Color.gelb)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
        
    }
}

#Preview {
    LexikonView()
}
