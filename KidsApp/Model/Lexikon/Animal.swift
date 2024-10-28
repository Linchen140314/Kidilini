//
//  Animal.swift
//  Kidsapp
//
//  Created by Jacqueline Kolbe on 28.08.24.
//

import Foundation

struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let imageName: String
}

