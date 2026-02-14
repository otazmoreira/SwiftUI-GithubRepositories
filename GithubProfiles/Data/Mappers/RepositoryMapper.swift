//
//  RepositoryMapper.swift
//  GithubProfiles
//
//  Created by Otávio Moreira on 13/02/26.
//

struct RepositoryMapper {
    func map(response: [GitHubRepositoryDTO]) -> [Repository] {
        return response.map { repo in
            Repository(
                id: "\(repo.id)",
                name: repo.name,
            )
        }
    }
}
