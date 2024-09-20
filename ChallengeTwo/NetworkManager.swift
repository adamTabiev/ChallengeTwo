//
//  NetworkManager.swift
//  ChallengeTwo
//
//  Created by Адам Табиев on 20.09.2024.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var artists: [Artist] = []

    func fetchArtists() {
        guard let url = URL(string: "https://cdn.accelonline.io/OUR6G_IgJkCvBg5qurB2Ag/files/YPHn3cnKEk2NutI6fHK04Q.json") else {
            print("Некорректный URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    // Декодируем корневой объект, который содержит ключ "artists"
                    let jsonResponse = try decoder.decode([String: [Artist]].self, from: data)
                    if let artists = jsonResponse["artists"] {
                        DispatchQueue.main.async {
                            self.artists = artists
                        }
                    }
                } catch {
                    print("Ошибка декодирования JSON: \(error)")
                }
            } else if let error = error {
                print("Ошибка загрузки данных: \(error)")
            }
        }.resume()
    }
}

