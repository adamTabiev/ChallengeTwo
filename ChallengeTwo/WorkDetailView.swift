//
//  WorkDetailView.swift
//  ChallengeTwo
//
//  Created by Адам Табиев on 20.09.2024.
//

import SwiftUI

struct WorkDetailView: View {
    let work: Work
    @State private var isFullScreen = false
    
    var body: some View {
        ScrollView {
            Text(work.title)
                .font(.title)
                .padding()
            
            Spacer()
            
            ZStack() {
                Image(work.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal)
                    .onTapGesture {
                        isFullScreen.toggle()
                    }
                    .fullScreenCover(isPresented: $isFullScreen) {
                        FullScreenImageView(work: work)
                    }
            }
            
            Spacer()
            
            Text(work.info)
                .padding()
        }
        .navigationTitle(work.title)
    }
}



#Preview {
    WorkDetailView(work: Work(title: "Звёздная ночь", image: "VanGogh1", info: "Одна из самых известных картин Ван Гога."))
}
