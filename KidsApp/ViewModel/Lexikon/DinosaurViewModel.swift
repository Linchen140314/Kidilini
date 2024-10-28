//
//  DinosaurViewModel.swift
//  Kidsapp
//
//  Created by Jacqueline Kolbe on 11.09.24.
//

import Foundation

class DinosaurViewModel: ObservableObject {
    @Published var dinosaurs: [Dinosaur] = []

    init() {
        loadDinosaurs()
    }

    private func loadDinosaurs() {
        // Dinosaurier hinzufügen
        dinosaurs = [
            Dinosaur(name: "Tyrannosaurus Rex", description: "Tyrannosaurus Rex, oft als T-Rex bezeichnet, war ein großer fleischfressender Dinosaurier, der vor etwa 68 bis 66 Millionen Jahren lebte.", imageName: "tyrannosaurus"),
            Dinosaur(name: "Velociraptor", description: "Velociraptor war ein kleiner, schneller Dinosaurier, bekannt für seine Intelligenz und Jagdstrategien, die in Rudeln lebten.", imageName: "velociraptor"),
            Dinosaur(name: "Triceratops", description: "Triceratops war ein Pflanzenfresser, bekannt für sein charakteristisches dreihörniges Gesicht und seinen starken Nackenpanzer.", imageName: "triceratops"),
            Dinosaur(name: "Stegosaurus", description: "Stegosaurus ist bekannt für seine großen Knochenschildkrötenplatten auf dem Rücken und seinen stacheligen Schwanz, der als Waffe verwendet wurde.", imageName: "stegosaurus"),
            Dinosaur(name: "Brachiosaurus", description: "Brachiosaurus war einer der größten Dinosaurier, bekannt für seinen langen Hals, mit dem er hohe Bäume erreichen konnte.", imageName: "brachiosaurus"),
            Dinosaur(name: "Spinosaurus", description: "Spinosaurus war ein großer theropoder Dinosaurier, der sowohl an Land als auch im Wasser lebte und sich von Fischen ernährte.", imageName: "spinosaurus"),
            Dinosaur(name: "Ankylosaurus", description: "Ankylosaurus war ein gepanzerter Dinosaurier mit einem massiven Körper und einem Keule Schwanz, der ihn vor Raubtieren schützte.", imageName: "ankylosaurus"),
            Dinosaur(name: "Diplodocus", description: "Diplodocus war ein langhalsiger Dinosaurier, der in Herden lebte und große Mengen an Pflanzenmaterial fraß.", imageName: "diplodocus"),
            Dinosaur(name: "Allosaurus", description: "Allosaurus war ein großer Fleischfresser, der vor den mächtigen Tyrannosaurus Rex lebte und sich durch Schnelligkeit und Kraft auszeichnete.", imageName: "allosaurus"),
            Dinosaur(name: "Pteranodon", description: "Pteranodon war kein Dinosaurier, sondern ein fliegendes Reptil, bekannt für seine großen Flügel und seinen charakteristischen Schnabel.", imageName: "pteranodon"),
        ]
    }
}

