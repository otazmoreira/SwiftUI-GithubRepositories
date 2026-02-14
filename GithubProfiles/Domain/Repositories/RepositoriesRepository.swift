//
//  RepositoriesRepository.swift
//  GithubProfiles
//
//  Created by Otávio Moreira on 12/02/26.
//

protocol RepositoriesRepository {
    func getRepositories(username: String) async throws -> [Repository]
}
