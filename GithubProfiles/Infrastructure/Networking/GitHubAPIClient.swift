//
//  GitHubAPIClient.swift
//  GithubProfiles
//
//  Created by Otávio Moreira on 12/02/26.
//

import Foundation

protocol GitHubAPIClient {
    func fetchRepositories(username: String) async throws -> [GitHubRepositoryDTO]
}

final class GitHubApiClientImpl : GitHubAPIClient {
    private let session: URLSession
    private let decoder: JSONDecoder
    
    init(
        session: URLSession = .shared,
        decoder: JSONDecoder = GitHubApiClientImpl.makeDecoder()
    ) {
        self.session = session
        self.decoder = decoder
    }
    
    // MARK: - Public API
    
    func fetchRepositories(username: String) async throws -> [GitHubRepositoryDTO] {
        let request = try makeRequest(path: "/users/\(username)/repos")
        
        let (data, response) = try await session.data(for: request)
        try validate(response)
        
        return try decode([GitHubRepositoryDTO].self, from: data)
    }
    
}

private extension GitHubApiClientImpl {
    static func makeDecoder() -> JSONDecoder {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        return jsonDecoder
    }
    
    func makeRequest(path: String) throws -> URLRequest {
        guard let url = URL(string: "https://api.github.com\(path)") else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("GithubProfiles", forHTTPHeaderField: "User-Agent")
        
        return request
    }
    
    func validate(_ response: URLResponse) throws {
        guard let http = response as? HTTPURLResponse else {
            throw NetworkError.unknown
        }
        
        let statusCode = http.statusCode
        
        guard (200..<300).contains(statusCode) else {
            throw NetworkError.requestFailed(statusCode: statusCode)
        }
    }
    
    func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
        do {
            return try decoder.decode(type, from: data)
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}
