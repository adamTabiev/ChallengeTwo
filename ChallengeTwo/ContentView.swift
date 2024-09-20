//
//  ContentView.swift
//  ChallengeTwo
//
//  Created by Адам Табиев on 20.09.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager() // ObservedObject для наблюдения за изменениями в NetworkManager (сетевые запросы).
    @State private var searchText = "" // State для управления текстом поиска в режиме реального времени.

    var filteredArtists: [Artist] { // Вычисляемое свойство для фильтрации художников.
        if searchText.isEmpty { // Если поле поиска пустое, возвращаем всех художников.
            return networkManager.artists
        } else { // Иначе фильтруем художников по имени или названию произведений.
            return networkManager.artists.filter { artist in
                artist.name.lowercased().contains(searchText.lowercased()) || // Фильтр по имени.
                artist.works.contains { work in
                    work.title.lowercased().contains(searchText.lowercased()) // Фильтр по названию произведений.
                }
            }
        }
    }

    var body: some View {
        NavigationView { // Навигационный вид для перехода между экранами.
            List(filteredArtists) { artist in // Отображение списка отфильтрованных художников.
                NavigationLink(destination: ArtistDetailView(artist: artist)) { // Переход к экрану с деталями художника.
                    HStack { // Горизонтальное выравнивание изображения и текста.
                        Image(artist.image) // Изображение художника из ассетов.
                            .resizable() // Изображение изменяемого размера.
                            .frame(width: 50, height: 50) // Устанавливаем размеры.
                            .clipShape(Circle()) // Изображение в форме круга.
                        VStack(alignment: .leading) { // Вертикальное выравнивание текста.
                            Text(artist.name) // Отображаем имя художника.
                                .font(.headline) // Задаём стиль заголовка.
                            Text(artist.bio) // Отображаем биографию.
                                .font(.subheadline) // Задаём стиль подзаголовка.
                                .lineLimit(2) // Ограничиваем количество строк.
                        }
                    }
                }
            }
            .navigationTitle("Художники") // Заголовок навигационного бара.
            .onAppear { // Действие при появлении экрана.
                networkManager.fetchArtists() // Запрашиваем данные художников.
            }
            .searchable(text: $searchText, prompt: "Поиск по автору или картине") // Добавляем поиск по тексту.
        }
    }
}



#Preview {
    ContentView()
}
