//
//  APIError.swift
//  ECommerce
//
//  Created by bovsheva on 24.08.2022.
//

import Foundation

/// Enum for error description
enum APIError: Error, CustomStringConvertible {
    case badUrl
    case badResponse(statusCode: Int)
    case urlSessionError(URLError?)
    case parsing(DecodingError?)
    case uknown
    
    var localizedDescription: String {
        // for users
        switch self {
            
            case .badUrl, .parsing, .uknown:
                return "Sorry, something went wrong."
            
            case .badResponse(_):
                return "Sorry, the connection to our server failed."
            
            case .urlSessionError(let error):
                return error?.localizedDescription ?? "Sorry, something went wrong."
        }
    }
    
    var description: String {
        // for debugging
        switch self {
            case .badUrl:
                return "Invalid url"
            
            case .badResponse(statusCode: let code):
                return "Bad response with status code \(code)"
            
            case .urlSessionError(let error):
                return "URL session error \(error?.localizedDescription ?? "")"
            
            case .parsing(let error):
                return "Decoding error \(error?.localizedDescription ?? "")"
            
            case .uknown: return "Uknown error"
                
        }
    }
}
