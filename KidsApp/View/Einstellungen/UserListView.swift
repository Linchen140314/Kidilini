//
//  UserListView.swift
//  Kidsapp
//
//  Created by Jacqueline Kolbe on 11.09.24.
//

import SwiftUI
import CoreData

struct UserListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: User.entity(), sortDescriptors: [])
    var users: FetchedResults<User>

    var body: some View {
        List {
            ForEach(users, id: \.self) { user in
                HStack {
                    Text(user.name ?? "Unbekannt")
                    Spacer()
                    Button(action: {
                        deleteUser(user: user)
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                }
            }
            .onDelete(perform: deleteUsers) // Für Swipe-to-Delete
        }
    }

    private func deleteUser(user: User) {
        viewContext.delete(user)
        
        do {
            try viewContext.save()
        } catch {
            // Fehlerbehandlung
            print("Fehler beim Löschen: \(error)")
        }
    }

    private func deleteUsers(at offsets: IndexSet) {
        for index in offsets {
            let user = users[index]
            viewContext.delete(user)
        }

        do {
            try viewContext.save()
        } catch {
            // Fehlerbehandlung
            print("Fehler beim Löschen: \(error)")
        }
    }
}

#Preview {
    UserListView()
}

