//
//  ContentView.swift
//  Kidsapp
//
//  Created by Jacqueline Kolbe on 28.08.24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = AnimalViewModel()
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground() // Durchsichtiger Hintergrund für die Navigations bar
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                // Hintergrundbild
                Image("hintergrund")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea() // Deckt den gesamten Bildschirm ab
                
                List(viewModel.animals) { animal in
                    NavigationLink(destination: AnimalDetailView(animal: animal)) {
                        HStack {
                            Image(animal.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80) // Vergrößertes Bild
                                .padding()
                            
                            Text(animal.name)
                                .font(.title) // Vergrößerte Schrift
                                .foregroundColor(.white) // Schrift in Weiß
                        }
                        .padding(.vertical, 10) // Mehr Platz zwischen den Einträgen
                    }
                    .listRowBackground(Color.clear) // Transparenter Hintergrund für die Listeneinträge
                }
                .listStyle(.plain)
            }
        }
    }
}

#Preview {
    ContentView()
}
