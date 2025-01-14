//
//  ImageLoader.swift
//  CoinRanking
//
//  Created by Ernest Mwangi on 13/01/2025.
//

import Foundation

class ImageLoader: ObservableObject {
    @Published var downloadedImageData: Data?

    func downloadImage(image_url: String) {
        guard let imageURL = URL(string: image_url) else {
            return
        }

        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            guard let data, error == nil else {
                return
            }

            DispatchQueue.main.async {
                self.downloadedImageData = data
            }
        }
        .resume()
    }
}
