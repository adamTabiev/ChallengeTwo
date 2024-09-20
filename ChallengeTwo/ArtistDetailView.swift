//
//  ArtistDetailView.swift
//  ChallengeTwo
//
//  Created by Адам Табиев on 20.09.2024.
//

import SwiftUI

struct ArtistDetailView: View {
    let artist: Artist // Получаем информацию о художнике, выбранном на предыдущем экране.

    var body: some View {
        List(artist.works) { work in // Отображаем список произведений художника.
            NavigationLink(destination: WorkDetailView(work: work)) { // Переход к экрану с деталями произведения.
                HStack { // Горизонтальное выравнивание изображения и текста.
                    Image(work.image) // Изображение произведения.
                        .resizable() // Изображение изменяемого размера.
                        .frame(width: 50, height: 50) // Устанавливаем размеры изображения.
                    VStack(alignment: .leading) { // Вертикальное выравнивание текста.
                        Text(work.title) // Отображаем название произведения.
                            .font(.headline) // Стиль заголовка.
                        Text(work.info) // Краткая информация о произведении.
                            .font(.subheadline) // Стиль подзаголовка.
                            .lineLimit(1) // Ограничиваем до одной строки.
                    }
                }
            }
        }
        .navigationTitle(artist.name) // Заголовок экрана с именем художника.
    }
}



//#Preview {
//    ArtistDetailView()
//}
