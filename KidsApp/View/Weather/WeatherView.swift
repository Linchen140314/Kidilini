//
//  WeatherView.swift
//  Kidsapp
//
//  Created by Jacqueline Kolbe on 20.09.24.
//

import SwiftUI

struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel()

    var body: some View {
        ZStack {
            Image("hintergrund")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
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
                    .frame(width: 200, height: 200)

                Button("Wetter aktualisieren") {
                    viewModel.fetchWeather(for: "Soltau")
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
            }
            .padding()
        }
        .onAppear {
            viewModel.fetchWeather(for: "Berlin")
        }
    }
    
}

#Preview {
    
    WeatherView()
}

