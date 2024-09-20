//
//  FullScreenImageView.swift
//  ChallengeTwo
//
//  Created by Адам Табиев on 20.09.2024.
//

import SwiftUI

struct FullScreenImageView: View {
    let work: Work // Получаем информацию о произведении.
    @Environment(\.presentationMode) var presentationMode // Системное окружение для закрытия экрана.

    var body: some View {
        ZStack(alignment: .topTrailing) { // Наложение кнопки закрытия в правом верхнем углу.
            Color.black.edgesIgnoringSafeArea(.all) // Черный фон для полноэкранного режима.
            Image(work.image) // Изображение произведения.
                .resizable() // Изображение изменяемого размера.
                .scaledToFit() // Масштабируем изображение.
                .background(Color.black) // Фон изображения — черный.
                .edgesIgnoringSafeArea(.all) // Применяем изображение на весь экран.

            Button(action: {
                presentationMode.wrappedValue.dismiss() // Закрываем полноэкранное представление.
            }) {
                Image(systemName: "xmark.circle.fill") // Иконка закрытия экрана.
                    .font(.largeTitle) // Размер иконки — большой.
                    .padding() // Добавляем отступы.
                    .foregroundColor(.white) // Цвет иконки — белый.
            }
        }
    }
}



//#Preview {
//    FullScreenImageView()
//}
