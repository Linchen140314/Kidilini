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
    
    @State private var newName: String = ""

    var body: some View {
        ZStack {
            // Hintergrundbild
            Image("hintergrund")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                Text("Einstellungen")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.gelb.opacity(1))
                    .cornerRadius(10)

                // Name ändern Textfeld
                if let user = users.first {
                    TextField("Neuer Name", text: $newName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button(action: {
                        updateUserName(user)
                    }) {
                        Text("Namen ändern")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.turquoise)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                }

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

    private func updateUserName(_ user: User) {
        user.name = newName

        do {
            try viewContext.save()
            newName = "" // Textfeld zurücksetzen
        } catch {
            print("Fehler beim Aktualisieren des Namens: \(error.localizedDescription)")
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
