//
//  FullScreenImageView.swift
//  ChallengeTwo
//
//  Created by Адам Табиев on 20.09.2024.
//

import SwiftUI

struct FullScreenImageView: View {
    let work: Work
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                Image(work.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                Spacer() 
            }
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.white)
            }
        }
    }
}



#Preview {
    FullScreenImageView(work: Work(title: "Звёздная ночь", image: "VanGogh1", info: "Одна из самых известных картин Ван Гога."))
}
