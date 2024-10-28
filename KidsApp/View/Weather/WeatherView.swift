import SwiftUI

struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel()
    @State private var isAnimating = false // State für die Animation
    @State private var isLoading = false // State für den Ladeindikator
    @State private var zipCode: String = "" // Postleitzahl State
    
    var body: some View {
        ZStack {
            // Hintergrundbild
            Image("hintergrund")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                // Eingabefeld für die Postleitzahl
                TextField("Postleitzahl eingeben", text: $zipCode)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.white.opacity(0.10))
                    .cornerRadius(10)
                
                // Ladeanzeige anzeigen, wenn Daten geladen werden
                if isLoading {
                    ProgressView("Wetter wird geladen...")
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .font(.headline)
                        .padding()
                } else {
                    // Wetterinformationen in einer stilisierten Box
                    VStack {
                        Text("Temperatur: \(viewModel.temperature)")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        
                        Text(viewModel.humidity)
                            .font(.title2)
                            .foregroundColor(.white)
                        
                        Text("Bedingung: \(viewModel.weatherCondition)")
                            .font(.title2)
                            .foregroundColor(.white)
                        
                        Image(viewModel.setWeatherImage(for: viewModel.weatherCondition))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .padding()
                    }
                    .padding()
                    .cornerRadius(15)
                    .padding()
                }

                // Animierter Button zum Aktualisieren des Wetters
                Button(action: {
                    guard !zipCode.isEmpty else {
                        print("Postleitzahl darf nicht leer sein.")
                        return
                    }
                    isLoading = true
                    viewModel.fetchWeather(for: zipCode) {
                        isLoading = false // Ladeanzeige ausblenden, wenn der Abruf abgeschlossen ist
                    }
                }) {
                    Text("Wetter aktualisieren")
                        .font(.title3)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .scaleEffect(isAnimating ? 1.1 : 1.0) // Button-Animation
                }
                .padding()
                .onAppear {
                    // Animation starten
                    withAnimation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                        isAnimating.toggle()
                    }
                }
            }
            .padding()
        }
        .onAppear {
            // Wetter für Berlin beim Start laden
            isLoading = true
            viewModel.fetchWeather(for: "Berlin") {
                isLoading = false // Ladeanzeige ausblenden, wenn der Abruf abgeschlossen ist
            }
        }
    }
}

#Preview {
    WeatherView()
}
