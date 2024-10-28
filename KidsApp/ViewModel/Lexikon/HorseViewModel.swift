//
//  HorseViewModel.swift
//  Kidsapp
//
//  Created by Jacqueline Kolbe on 18.09.24.
//


import Foundation

class HorseViewModel: ObservableObject {
    @Published var horses: [Horse] = []

    init() {
        loadHorses()
    }

    private func loadHorses() {
        // Pferderassen hinzufügen
        horses = [
            Horse(name: "Arabisches Pferd", description: "Das Arabische Pferd ist bekannt für seine Geschwindigkeit, Ausdauer und eleganten Körperbau.", imageName: "arabian_horse"),
            Horse(name: "Vollblutpferd", description: "Das Vollblutpferd ist eine Pferderasse, die hauptsächlich für Pferderennen gezüchtet wurde.", imageName: "thoroughbred"),
            Horse(name: "Shire Horse", description: "Das Shire Horse ist eine der größten Pferderassen und bekannt für seine Stärke und Zugkraft.", imageName: "shire_horse"),
            Horse(name: "Mustang", description: "Der Mustang ist ein wildes Pferd aus Nordamerika und bekannt für seine Freiheit und Ausdauer.", imageName: "mustang"),
            Horse(name: "Friesenpferd", description: "Das Friesenpferd ist für seine schwarze Farbe, Eleganz und seine Fähigkeit in der Dressur bekannt.", imageName: "friesian_horse"),
            Horse(name: "Appaloosa", description: "Der Appaloosa ist für seine auffällige Fleckenfarbe und sein vielseitiges Temperament bekannt.", imageName: "appaloosa"),
            Horse(name: "Clydesdale", description: "Das Clydesdale ist eine schwere Zugpferderasse, bekannt für seine große Größe und Federung an den Beinen.", imageName: "clydesdale"),
            Horse(name: "Quarter Horse", description: "Das Quarter Horse ist eine vielseitige Pferderasse, die besonders im Westernreiten beliebt ist.", imageName: "quarter_horse"),
            Horse(name: "Paint Horse", description: "Das Paint Horse zeichnet sich durch seine farbenprächtigen Scheckungen aus und ist für seine Vielseitigkeit bekannt.", imageName: "paint_horse"),
            Horse(name: "Shetlandpony", description: "Das Shetlandpony ist eine kleine, robuste Pferderasse, die oft als Kinderpony verwendet wird.", imageName: "shetland_pony"),
        ]
    }
}


