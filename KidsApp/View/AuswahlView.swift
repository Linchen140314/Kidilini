//
//  StartScreenView.swift
//  Kidsapp
//
//  Created by Jacqueline Kolbe on 28.08.24.
//

import SwiftUI
import CoreData

struct StartScreenView: View {
    @FetchRequest(entity: User.entity(), sortDescriptors: [])
    var users: FetchedResults<User>
  
    
    var body: some View {
        ZStack {
            Image("hintergrund") // Dein Hintergrundbild
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                if let user = users.first {
                    Text("Willkommen \(user.name ?? "Kind")!")
                        .font(.largeTitle)
                        .padding(10)
                        .foregroundColor(.white)
                } else {
                    Text("Willkommen")
                        .font(.largeTitle)
                        .padding(10)
                        .foregroundColor(.white)
                }

                // Hier kannst du weitere Navigation Links hinzufügen
                NavigationLink(destination: LexikonView()) {
                    Text("Lexikon's     ")
                        .font(.title)
                        .padding()
                        .background(Color.turquoise)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                .padding(.bottom, 10)

                NavigationLink(destination: MahteklassenView()) {
                    Text("Mathe üben")
                        .font(.title)
                        .padding()
                        .background(Color.turquoise)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                .padding(.bottom, 10)

                NavigationLink(destination: WeatherView()) {
                    Text("Wetter          ")
                        .font(.title)
                        .padding()
                        .background(Color.turquoise)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    StartScreenView()
}
