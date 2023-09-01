//
//  ApiError.swift
//  DishApp
//
//  Created by MacBook Air on 31.08.2023.
//

import Foundation

enum ApiError: Error, CustomStringConvertible {
    
    case badURL
    case urlSession(URLError?)
    case badResponse(Int)
    case decoding(DecodingError)
    case unknown
    
    var description: String {
        switch self {
        case .badURL:
            return "Bad url"
        case .urlSession(let error):
            return "Url session: \(error.debugDescription)"
        case .badResponse(let statusCode):
           return "Bad response: \(statusCode)"
        case .decoding(let decodingError):
           return "Decoding error: \(decodingError)"
        case .unknown:
           return "Unknown error occured"
        }
    }
    
    var localizedDescription: String {
        switch self {
        case .badURL:
            return "Bad url"
        case .urlSession(let error):
            return error?.localizedDescription ?? "smth went wrong"
        case .decoding(let decodingError):
            return decodingError.localizedDescription
        default:
            return "smth went wrong"
        }
    }
}
