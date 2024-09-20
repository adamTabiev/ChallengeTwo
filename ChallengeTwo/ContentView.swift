//
//  ContentView.swift
//  ChallengeTwo
//
//  Created by Адам Табиев on 20.09.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var networkManager = NetworkManager()
    @State private var searchText = "" 

    var filteredArtists: [Artist] {
        if searchText.isEmpty {
            return networkManager.artists
        } else {
            return networkManager.artists.filter { artist in
                artist.name.lowercased().contains(searchText.lowercased()) ||
                artist.works.contains { work in
                    work.title.lowercased().contains(searchText.lowercased())
                }
            }
        }
    }

    var body: some View {
        NavigationStack {
            List(filteredArtists) { artist in
                NavigationLink(destination: ArtistDetailView(artist: artist)) {
                    HStack {
                        Image(artist.image)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        VStack(alignment: .leading) {
                            Text(artist.name)
                                .font(.headline)
                            Text(artist.bio)
                                .font(.subheadline)
                                .lineLimit(2)
                        }
                    }
                }
            }
            .navigationTitle("Художники")
            .onAppear {
                networkManager.fetchArtists()
            }
            .searchable(text: $searchText, prompt: "Поиск по автору или картине")
        }
    }
}



#Preview {
    ContentView()
}
