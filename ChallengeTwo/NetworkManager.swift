//
//  NetworkManager.swift
//  ChallengeTwo
//
//  Created by Адам Табиев on 20.09.2024.
//

import Foundation

class NetworkManager: ObservableObject { // Сетевой менеджер для работы с данными, которые можно наблюдать в SwiftUI.
    @Published var artists: [Artist] = []

    func fetchArtists() { // Функция для загрузки списка художников.
        guard let url = URL(string: "https://cdn.accelonline.io/OUR6G_IgJkCvBg5qurB2Ag/files/YPHn3cnKEk2NutI6fHK04Q.json") else {
            print("Некорректный URL") // Сообщаем об ошибке, если URL некорректен.
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in // Отправляем сетевой запрос.
            if let data = data { // Проверяем, есть ли данные.
                let decoder = JSONDecoder() // Создаём декодер JSON.
                do {
                    let jsonResponse = try decoder.decode([String: [Artist]].self, from: data) // Декодируем JSON ответ.
                    if let artists = jsonResponse["artists"] { // Извлекаем список художников из JSON.
                        DispatchQueue.main.async { // Выполняем обновление в основном потоке.
                            self.artists = artists // Обновляем список художников.
                        }
                    }
                } catch {
                    print("Ошибка декодирования JSON: \(error)") // Сообщаем об ошибке декодирования.
                }
            } else if let error = error { // Проверяем наличие ошибок запроса.
                print("Ошибка загрузки данных: \(error)") // Сообщаем об ошибке загрузки данных.
            }
        }.resume() // Запускаем задачу загрузки данных.
    }
}


