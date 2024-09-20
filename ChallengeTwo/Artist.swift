//
//  Artist.swift
//  ChallengeTwo
//
//  Created by Адам Табиев on 20.09.2024.
//

import Foundation

// MARK: - Artist
struct Artist: Codable, Identifiable {
    let id = UUID()
    let name: String
    let bio: String
    let image: String
    let works: [Work]
}

// MARK: - Work
struct Work: Codable, Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let info: String
}
