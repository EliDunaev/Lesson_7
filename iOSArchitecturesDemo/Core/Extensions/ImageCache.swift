//
//  ImageCache.swift
//  iOSArchitecturesDemo
//
//  Created by Илья Дунаев on 21.11.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

// MARK: - Extesion for image caching

import Kingfisher

func imageCache(url: String, completion: @escaping(UIImage)->()) {
    
    let imageUrl = URL(string: url)!
    KingfisherManager.shared.retrieveImage(with: imageUrl) { result in
        let image = try? result.get().image
        if let image = image {
            completion(image)
        }
    }
}
