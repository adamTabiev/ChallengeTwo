//
//  ArtistDetailView.swift
//  ChallengeTwo
//
//  Created by Адам Табиев on 20.09.2024.
//

import SwiftUI

struct ArtistDetailView: View {
    let artist: Artist

    var body: some View {
        List(artist.works) { work in
            NavigationLink(destination: WorkDetailView(work: work)) {
                HStack {
                    Image(work.image)
                        .resizable()
                        .frame(width: 50, height: 50)
                    VStack(alignment: .leading) {
                        Text(work.title)
                            .font(.headline)
                        Text(work.info)
                            .font(.subheadline)
                            .lineLimit(1)
                    }
                }
            }
        }
        .navigationTitle(artist.name)
    }
}


//#Preview {
//    ArtistDetailView()
//}
