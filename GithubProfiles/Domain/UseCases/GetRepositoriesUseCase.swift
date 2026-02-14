//
//  GetRepositoriesUseCase.swift
//  GithubProfiles
//
//  Created by Otávio Moreira on 12/02/26.
//

struct GetRepositoriesUseCase {
    private let repositoriesRepository: RepositoriesRepository
    
    init(repositoriesRepository: RepositoriesRepository) {
        self.repositoriesRepository = repositoriesRepository
    }
    
    func getRepositories(username: String) async throws -> [Repository] {
        return try await repositoriesRepository.getRepositories(username: username)
    }
}
