//
//  DinosaurListView.swift
//  Kidsapp
//
//  Created by Jacqueline Kolbe on 11.09.24.
//

import SwiftUI

struct DinosaurListView: View {
    @ObservedObject var viewModel = DinosaurViewModel()
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground() // Durchsichtiger Hintergrund für die Navigations bar
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        ZStack {
            // Hintergrundbild
            Image("hintergrund")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea() // Deckt den gesamten Bildschirm ab
            
            List(viewModel.dinosaurs, id: \.name) { dinosaur in
                            NavigationLink(destination: DinosaurDetailView(dinosaur: dinosaur)) {
                    HStack {
                        Image(dinosaur.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80) // Vergrößertes Bild
                            .padding()
                        
                        Text(dinosaur.name)
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

#Preview {
    DinosaurListView()
}
