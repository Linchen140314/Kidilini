//
//  HorseListView.swift
//  Kidsapp
//
//  Created by Jacqueline Kolbe on 20.09.24.
//

import SwiftUI

struct HorseListView: View {
    @ObservedObject var viewModel = HorseViewModel()
    
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
            
            List(viewModel.horses, id: \.name) { horse in
                            NavigationLink(destination: HorseDetailView(horse: horse)) {
                    HStack {
                        Image(horse.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80) // Vergrößertes Bild
                            .padding()
                        
                        Text(horse.name)
                            .font(.title) // Vergrößerte Schrift
                            .foregroundColor(.white) // Schrift in Weiß
                    }
                    .padding(.vertical, 10) // Mehr Platz zwischen den Einträgen
                }
                .listRowBackground(Color.clear) // Transparenter Hintergrund für die Listeneinträge
            }
            .listStyle(.plain)
            .navigationTitle("Pferde Lexikon")
        }
    }
}

#Preview {
    HorseListView()
}
