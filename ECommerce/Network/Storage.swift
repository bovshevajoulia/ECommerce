//
//  Storage.swift
//  ECommerce
//
//  Created by bovsheva on 24.08.2022.
//

import Foundation
import UIKit

/// Singleton object to store images to the 'NSCache'
/// If the memory limit for application is reached cache will remove images
final class Storage: NSObject {
    
    static let shared = Storage()
    
    private override init() {}
    
    private let cache = NSCache<NSString, UIImage>()
    
    
    // MARK: Public functions
    
    /// Get image from cache by url
    /// - Parameter url: url string
    /// - Returns: UIImage if it exists or nil - otherwise
    public func getImage(url: String) -> UIImage? {
        let cacheKey = NSString(string: url)
        
        if let image = self.cache.object(forKey: cacheKey) {
            return image
        }
        return nil
    }
    
    /// Store image
    /// - Parameters:
    ///   - url: url string
    ///   - image: image object
    public func setImage(url: String, image: UIImage) {
        let cacheKey = NSString(string: url)
        
        self.cache.setObject(image, forKey: cacheKey)
    }
    
    /// Clear cache
    public func clear() {
        self.cache.removeAllObjects()
    }
}
