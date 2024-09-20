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
        VStack {
            Text(work.title)
                .font(.title)
                .padding()

            Spacer()

            ZStack(alignment: .bottomTrailing) {
                Image(work.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture {
                        withAnimation {
                            isFullScreen.toggle()
                        }
                    }
                    .fullScreenCover(isPresented: $isFullScreen) {
                        FullScreenImageView(work: work)
                    }

                Image(systemName: "arrow.up.left.and.arrow.down.right")
                    .padding()
            }

            Spacer()

            Text(work.info)
                .padding()
        }
        .navigationTitle(work.title)
    }
}


//#Preview {
//    WorkDetailView()
//}
