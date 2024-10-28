//
//  SettingsView.swift
//  Kidsapp
//
//  Created by Jacqueline Kolbe on 11.09.24.
//

import SwiftUI
import CoreData

struct SettingsView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: User.entity(), sortDescriptors: [])
    var users: FetchedResults<User>

    var body: some View {
        ZStack {
            // Hintergrundbild hinzufügen
            Image("hintergrund") // Ersetze "hintergrundbild" durch den Namen deines Bildes
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                Text("Einstellungen")
                    .font(.largeTitle)
                    .foregroundColor(.black) // Schriftfarbe für bessere Lesbarkeit
                    .padding()
                    .background(Color.gelb.opacity(1)) // Hintergrund für besseren Kontrast
                    .cornerRadius(10)

                // Profil löschen Button
                Button(action: {
                    deleteProfiles()
                }) {
                    Text("Profile löschen")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity) // Button über die gesamte Breite
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                // Hier kannst du weitere Einstellungen hinzufügen
            }
            .padding()
        }
    }

    private func deleteProfiles() {
        for user in users {
            viewContext.delete(user)
        }

        do {
            try viewContext.save()
        } catch {
            print("Fehler beim Löschen der Profile: \(error.localizedDescription)")
        }
    }
}

#Preview {
    SettingsView()
        .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
