//
//  WorkDetailView.swift
//  ChallengeTwo
//
//  Created by Адам Табиев on 20.09.2024.
//

import SwiftUI

struct WorkDetailView: View {
    let work: Work // Получаем информацию о произведении, выбранном на предыдущем экране.
    @State private var isFullScreen = false // Состояние для управления полноэкранным режимом.

    var body: some View {
        VStack { // Вертикальное расположение контента.
            Text(work.title) // Отображаем заголовок произведения.
                .font(.title) // Стиль заголовка.
                .padding() // Добавляем отступы.

            Spacer() // Разделяем верхний и нижний контент.

            ZStack(alignment: .bottomTrailing) { // Наложение контента в правом нижнем углу.
                Image(work.image) // Изображение произведения.
                    .resizable() // Изображение изменяемого размера.
                    .aspectRatio(contentMode: .fit) // Подгоняем по размеру экрана.
                    .onTapGesture { // Обрабатываем нажатие на изображение.
                        withAnimation {
                            isFullScreen.toggle() // Включаем полноэкранный режим.
                        }
                    }
                    .fullScreenCover(isPresented: $isFullScreen) { // Полноэкранное представление изображения.
                        FullScreenImageView(work: work) // Переход к полноэкранному виду изображения.
                    }

                Image(systemName: "arrow.up.left.and.arrow.down.right") // Иконка для полноэкранного режима.
                    .padding() // Добавляем отступы.
            }

            Spacer() // Разделяем нижний и верхний контент.

            Text(work.info) // Отображаем информацию о произведении.
                .padding() // Добавляем отступы.
        }
        .navigationTitle(work.title) // Заголовок экрана с названием произведения.
    }
}



//#Preview {
//    WorkDetailView()
//}
