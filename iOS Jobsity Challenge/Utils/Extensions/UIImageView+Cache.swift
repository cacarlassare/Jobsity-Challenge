//
//  UIImageView+Cache.swift
//  iOS Jobsity Challenge
//
//  Created by Cristian Carlassare on 18/05/2022.
//

import UIKit


extension UIImageView {
    
    func load(url: String, placeholder: UIImage? = nil, cache: URLCache? = nil) {
        if let url = URL(string: url) {
            self.load(url: url, placeholder: placeholder, cache: cache)
        }
    }
    
    func load(url: URL, placeholder: UIImage? = nil, cache: URLCache? = nil) {
        let cache = cache ?? URLCache.shared
        let request = URLRequest(url: url)
        
        if let cachedData = cache.cachedResponse(for: request)?.data, let cachedImage = UIImage(data: cachedData) {
            DispatchQueue.main.async {
                self.image = cachedImage
            }
        } else {
            self.image = placeholder
            
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                
                if let data = data, let response = response, ((response as? HTTPURLResponse)?.statusCode ?? Int.max) < 300, let image = UIImage(data: data) {
                    let cachedResponse = CachedURLResponse(response: response, data: data)
                    cache.storeCachedResponse(cachedResponse, for: request)
                    
                    DispatchQueue.main.async {
                        self.image = image
                    }
                    
                }
            }).resume()
        }
    }
    
}
