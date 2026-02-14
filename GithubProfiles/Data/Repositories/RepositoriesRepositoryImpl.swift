//
//  RepositoriesRepositoryImpl.swift
//  GithubProfiles
//
//  Created by Otávio Moreira on 12/02/26.
//

final class RepositoriesRepositoryImpl : RepositoriesRepository {
    private let api: GitHubAPIClient
    
    init(api: GitHubAPIClient) {
        self.api = api
    }
    
    func getRepositories(username: String) async throws -> [Repository] {
        let repositories = try await api.fetchRepositories(username: username)
        return RepositoryMapper().map(response: repositories)
    }
}
