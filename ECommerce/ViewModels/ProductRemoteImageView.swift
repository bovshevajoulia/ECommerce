//
//  ProductRemoteImageView.swift
//  ECommerce
//
//  Created by bovsheva on 25.08.2022.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    // MARK: - Private
    
    private let forPreview: Bool
    
    // MARK: - init
    init(forPreview: Bool = false) {
        self.forPreview = forPreview
        print("ImageLoader: init")
    }
    
    func load(fromURL url: String) {
        NetworkService.fetchImage(from: url) { [unowned self] uiImage in
            guard let uiImage = uiImage else { return }
            
            DispatchQueue.main.async { [unowned self] in
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?
            .resizable() ?? Image("product-image-placeholder").resizable()
    }
}

struct ProductRemoteImageView: View {
    
    @StateObject private var imageLoader = ImageLoader()
    
    var urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear { imageLoader.load(fromURL: urlString) }
    }
}
