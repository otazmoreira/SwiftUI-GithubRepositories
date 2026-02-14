//
//  NetworkError.swift
//  GithubProfiles
//
//  Created by Otávio Moreira on 13/02/26.
//

enum NetworkError : Error {
    case invalidURL
    case requestFailed(statusCode: Int)
    case decodingFailed
    case noInternet
    case unknown
}
