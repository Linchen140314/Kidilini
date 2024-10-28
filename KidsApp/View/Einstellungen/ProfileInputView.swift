//
//  ProfileInputView.swift
//  Kidsapp
//
//  Created by Jacqueline Kolbe on 11.09.24.
//

import SwiftUI
import CoreData

struct ProfileInputView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var name: String = ""
    @State private var age: String = ""
    @State private var errorMessage: String?
    @State private var isSaved: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Hintergrundbild hinzufügen
                Image("hintergrund") // Dein Bildname hier
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea() // Bild über den gesamten Bildschirm strecken
                
                VStack {
                    Text("Gib deinen Namen und dein Alter ein.")
                        .font(.title)
                        .padding()
                        .background(Color.white.opacity(0.7)) // Hintergrund mit Transparenz für bessere Lesbarkeit
                        .cornerRadius(10)


                    
                    TextField("Name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    TextField("Alter", text: $age)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button("Start      ") {
                        saveProfile()
                    }
                    .padding()
                    .background(Color.turquoise)
                    .foregroundColor(.black)
                    .cornerRadius(20)
                    
                    // Fehlermeldung anzeigen, falls vorhanden
                    if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding()
                    }
                }
                .padding()
                .navigationDestination(isPresented: $isSaved) {
                    StartScreenView() // Zielansicht, wenn isSaved true ist
                }
            }
        }
    }
    
    private func saveProfile() {
        let newUser = User(context: viewContext)
        newUser.name = name
        newUser.age = Int16(age) ?? 0
        
        do {
            try viewContext.save()
            isSaved = true
            errorMessage = nil
        } catch {
            errorMessage = "Fehler beim Speichern des Profils: \(error.localizedDescription)"
            isSaved = false
        }
    }
}

#Preview {
    ProfileInputView()
        .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}



