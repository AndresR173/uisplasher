//
//  ContentView.swift
//  UIsplasher
//
//  Created by Andres Rojas on 29/06/20.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var viewModel: PhotosViewModel

    var body: some View {
        NavigationView {
            List(viewModel.photos) { photo in
                Text("\(photo.likes) likes")
            }
            .navigationBarTitle("Likes by Photo")
            .listStyle(GroupedListStyle())
        }.onAppear {
            viewModel.getPhotos()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: PhotosViewModel(source: .local))
    }
}
