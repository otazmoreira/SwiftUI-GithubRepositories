//
//  ListViewModel.swift
//  GithubProfiles
//
//  Created by Otávio Moreira on 12/02/26.
//

import Combine

@MainActor
final class ListViewModel: ObservableObject {
    private let getRepositoriesUseCase: GetRepositoriesUseCase
    
    @Published var repositories: Array<Repository>?
    @Published var username: String = ""
    
    init(getRepositoriesUseCase: GetRepositoriesUseCase) {
        self.getRepositoriesUseCase = getRepositoriesUseCase
    }
    
    func updateUsername(_ username: String) {
        self.username = username
    }
    
    func loadRepositories() {
        Task {
            do {
                repositories = try await getRepositoriesUseCase.getRepositories(
                    username: username,
                )
            } catch let error {
                print("something went wrong: \(error)")
            }
        }
    }
}
