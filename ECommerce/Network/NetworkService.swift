//
//  NetworkService.swift
//  ECommerce
//
//  Created by bovsheva on 24.08.2022.
//

import Foundation
import UIKit

protocol NetworkServiceProtocol {
    
    /// Fetch data from the REST API server
    /// - Parameter type: 'Codable' data type
    /// - Parameter url: URL string
    /// - Parameter complition: Completion handler
    /// - Returns: 'Void'
    func fetch<T: Codable>(
        _ type: T.Type,
        url: String?,
        completion: @escaping (Result<T,APIError>) -> Void
    )
    
    /// Fetch image from the REST API server
    /// - Parameters:
    ///   - urlString: URL string representation
    ///   - completion: Completion handler
    static func fetchImage(from urlString: String,
                       completion: @escaping (UIImage?) -> Void)
}

struct NetworkService: NetworkServiceProtocol {
    
    
    /// Fetch data from the REST API server
    /// - Parameter type: 'Codable' data type
    /// - Parameter url: URL string
    /// - Parameter complition: Completion handler
    /// - Returns: 'Void'
    func fetch<T: Codable>(
        _ type: T.Type,
        url: String?,
        completion: @escaping (Result<T,APIError>) -> Void
        
    ) {
        
        guard let url = url , let requestUrl = URL(string: url) else {
            completion(.failure(APIError.badUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: requestUrl) { data, response, error in
            
            if let error = error as? URLError {
                
                completion(.failure(APIError.urlSessionError(error)))
                
            } else if let response = response as? HTTPURLResponse,
                      !(200...299).contains(response.statusCode) {
                
                completion(.failure(APIError.badResponse(statusCode: response.statusCode)))
                
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let value = try decoder.decode(type, from: data)
                    completion(.success(value))
                    
                } catch {
                    completion(.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }
        
        task.resume()
    }
    
    
    /// Fetch image from the REST API server
    /// - Parameters:
    ///   - urlString: URL string representation
    ///   - completion: Completion handler
    static func fetchImage(from urlString: String,
                       completion: @escaping (UIImage?) -> Void) {
        
        if let image = Storage.shared.getImage(url: urlString) {
            completion(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            Storage.shared.setImage(url: urlString, image: image)
            completion(image)
        }
        
        task.resume()
    }

}
