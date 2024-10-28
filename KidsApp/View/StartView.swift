import SwiftUI
import CoreData
import AVFoundation

struct StartView: View {
    @State private var backgroundOffset: CGFloat = -UIScreen.main.bounds.height
    @State private var isContentVisible: Bool = false
    @State private var areButtonsVisible: Bool = false
    @FetchRequest(entity: User.entity(), sortDescriptors: [])
    var users: FetchedResults<User>
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Eigene Hintergrung Farbe
                Color.grau
                    .ignoresSafeArea() // Gesamter Bildschirm anzeige
                Image("start")
                    .resizable()
                    .scaledToFill()
                    .background(Color.grau)
                    .blur(radius: backgroundOffset == 0 ? 0 : 20)
                    .offset(y: backgroundOffset) // Verschiebt das Bild auf Offset
                    .animation(.easeInOut(duration: 2), value: backgroundOffset)

                VStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    Text("Klicke auf Start um zu Starten")
                        .padding()
                        .font(.title)
                        .foregroundColor(.white)
                        .opacity(isContentVisible ? 1 : 0)
                        .animation(.easeIn(duration: 2).delay(2), value: isContentVisible)
                    
                    // Sichtbarkeit der Buttons
                    if areButtonsVisible {
                        // NavigationLink für Start oder Profileingabe
                        if users.isEmpty {
                            NavigationLink(destination: ProfileInputView()) {
                                Text("Start")
                                    .font(.title)
                                    .padding()
                                    .background(Color.gelb)
                                    .foregroundColor(.black)
                                    .cornerRadius(20)
                                    .transition(.slide) // Animation für den Button
                                    .animation(.easeIn(duration: 2).delay(2), value: areButtonsVisible)
                            }
                        } else {
                            NavigationLink(destination: StartScreenView()) {
                                Text("Start")
                                    .font(.title)
                                    .padding()
                                    .background(Color.gelb)
                                    .foregroundColor(.black)
                                    .cornerRadius(20)
                                    .transition(.slide) // Animation für den Button
                                    .animation(.easeIn(duration: 2).delay(2), value: areButtonsVisible)
                            }
                        }
                        
                        // NavigationLink zu den Einstellungen
                        NavigationLink(destination: SettingsView()) {
                            Image(systemName: "gearshape.fill") // Symbol für Einstellungen
                                .font(.system(size: 40)) // Größe des Symbols
                                .padding()
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .transition(.slide) // Animation für den Button
                                .animation(.easeIn(duration: 2).delay(2), value: areButtonsVisible)
                        }
                        .padding(.top)
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .onAppear {
                SoundManager.instance.playSound(soundName: "startSound") // Sound abspielen beim Laden
                backgroundOffset = UIScreen.main.bounds.height // Startet das Bild außerhalb des sichtbaren Bereichs unten
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    backgroundOffset = 0 // Bringt das Bild nach oben in die Mitte
                    isContentVisible = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        areButtonsVisible = true
                    }
                }
            }
        }
    }
}

#Preview {
    StartView()
        .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext) // Verwende den Core Data Kontext für die Vorschau
}
