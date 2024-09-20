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
            Color.black.edgesIgnoringSafeArea(.all)
            Image(work.image)
                .resizable()
                .scaledToFit()
                .background(Color.black)
                .edgesIgnoringSafeArea(.all)

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


//#Preview {
//    FullScreenImageView()
//}
